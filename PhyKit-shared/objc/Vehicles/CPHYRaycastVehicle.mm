//
//  CPHYRaycastVehicle.m
//  PhyKit
//
//  Created by Sunil390 on 06/06/23.
//

#import <Foundation/Foundation.h>
#import "CPHYRaycastVehicle.h"
#import "CPHYRaycastVehicle+Internal.h"
#import "CPHYDependencies+Internal.h"
#import "CPHYCollisionShape.h"
#import "CPHYCollisionShape+Internal.h"
#import "CPHYWorld.h"
#import "CPHYWorld+Internal.h"
#import "CPHYStructs.h"
#import "CPHYStructs+Internal.h"

#define CUBE_HALF_EXTENTS 1

@interface CPHYRaycastVehicle() {
    int rightIndex;
    int upIndex;
    int forwardIndex;
    btVector3 wheelAxleCS;
    btVector3 wheelDirectionCS0;
    bool isFrontWheel;
}

@end

@implementation CPHYRaycastVehicle {}

-(instancetype)initWithChassisShape: (CPHYCollisionShape *)chassis_shape world: (CPHYWorld *)world mass:(float)mass wheelWidth:(float)wheelWidth wheelRadius:(float)wheelRadius  maxEngineForce:(float)maxEngineForce maxBreakingForce:(float)maxBreakingForce wheelFriction:(float)wheelFriction suspensionStiffness:(float)suspensionStiffness suspensionDamping:(float)suspensionDamping suspensionCompression:(float)suspensionCompression suspensionRestLength:(float)suspensionRestLength rollInfluence:(float)rollInfluence; {
    self = [super init];
    if (self) {
        btCompoundShape* compound = new btCompoundShape();
        btTransform localTransform;
        localTransform.setIdentity();
        localTransform.setOrigin(btVector3(0,1,0));
        compound->addChildShape(localTransform, chassis_shape.c_shape);
        
        btVector3 localInertia(0, 0, 0);
        bool isDynamic = (mass != 0);
        if (isDynamic) chassis_shape.c_shape->calculateLocalInertia(mass, localInertia);
        btRigidBody::btRigidBodyConstructionInfo c_constructionInfo = btRigidBody::btRigidBodyConstructionInfo(mass, nil, chassis_shape.c_shape, localInertia);
        c_constructionInfo.m_mass = mass;
        
        _m_carChassis = new btRigidBody(c_constructionInfo);
        _m_carChassis->setUserPointer((__bridge void*)self);
        [world btInternalAddRigidBody:_m_carChassis];
        
        rightIndex = 0;
        upIndex = 1;
        forwardIndex = 2;
        wheelAxleCS = btVector3(-1, 0 ,0);
        wheelDirectionCS0 = btVector3(0 ,-1, 0);
        isFrontWheel = true;
        
        _suspensionRestLength = btScalar(suspensionRestLength);
        
        _m_wheelShape = new btCylinderShapeX(btVector3(wheelWidth,wheelRadius,wheelRadius));
        
        // create vehicle
        {
            _m_vehicleRaycaster = new btDefaultVehicleRaycaster(world.world);
            _m_vehicle = new btRaycastVehicle(_tuning, _m_carChassis, _m_vehicleRaycaster);
            _m_carChassis->setActivationState(DISABLE_DEACTIVATION);
            
            float connectionHeight = 1.2f;// needs parametrising
            _m_vehicle->setCoordinateSystem(rightIndex, upIndex, forwardIndex);
            
            btVector3 connectionPointCS0(CUBE_HALF_EXTENTS-(0.3*wheelWidth),connectionHeight,2*CUBE_HALF_EXTENTS-wheelRadius);
            _m_vehicle->addWheel(connectionPointCS0,wheelDirectionCS0,wheelAxleCS,_suspensionRestLength,wheelRadius,_tuning,isFrontWheel); // needs parametrising
            
            connectionPointCS0 = btVector3(-CUBE_HALF_EXTENTS+(0.3*wheelWidth),connectionHeight,2*CUBE_HALF_EXTENTS-wheelRadius);
            _m_vehicle->addWheel(connectionPointCS0,wheelDirectionCS0,wheelAxleCS,_suspensionRestLength,wheelRadius,_tuning,isFrontWheel); //needs parametrising
            
            connectionPointCS0 = btVector3(-CUBE_HALF_EXTENTS+(0.3*wheelWidth),connectionHeight,-2*CUBE_HALF_EXTENTS+wheelRadius);
            isFrontWheel = false;
            _m_vehicle->addWheel(connectionPointCS0,wheelDirectionCS0,wheelAxleCS,_suspensionRestLength,wheelRadius,_tuning,isFrontWheel);//needs parametrising
            
            connectionPointCS0 = btVector3(CUBE_HALF_EXTENTS-(0.3*wheelWidth),connectionHeight,-2*CUBE_HALF_EXTENTS+wheelRadius);
            _m_vehicle->addWheel(connectionPointCS0,wheelDirectionCS0,wheelAxleCS,_suspensionRestLength,wheelRadius,_tuning,isFrontWheel);//needs parametrising
            
            for (int i=0;i<_m_vehicle->getNumWheels();i++)
                    {
                        btWheelInfo& wheel = _m_vehicle->getWheelInfo(i);
                        wheel.m_suspensionStiffness = suspensionStiffness;
                        wheel.m_wheelsDampingRelaxation = suspensionDamping;
                        wheel.m_wheelsDampingCompression = suspensionCompression;
                        wheel.m_frictionSlip = wheelFriction;
                        wheel.m_rollInfluence = rollInfluence;
                    }
        }
    }
    return self;
}

-(struct PHYMatrix4) getWheelPositions:(int)wheelIndex {;
    btScalar m[16];

    _m_vehicle->updateWheelTransform(wheelIndex, true);
    //draw wheels
    _m_vehicle->getWheelInfo(wheelIndex).m_worldTransform.getOpenGLMatrix(m);
    return PHYMatrix4MakeFromBTScalar(m);
}

-(struct PHYMatrix4) getChassisPosition {
    if (_m_vehicle) {
        return PHYMatrix4MakeFrom(_m_carChassis->getWorldTransform());
    } else {
        return PHYMatrix4MakeIdentity();
    }
}

-(void) applyEngineForce:(btScalar)gEngineForce breakingForce:(btScalar)gBreakingForce {
    if (_m_vehicle) {
        _m_vehicle->applyEngineForce(gEngineForce, 2);
        _m_vehicle->setBrake(gBreakingForce, 2);
        _m_vehicle->applyEngineForce(gEngineForce, 3);
        _m_vehicle->setBrake(gBreakingForce, 3);
    } else {
        
    }
}

-(void) steeringValue:(btScalar)gVehicleSteering {
    if (_m_vehicle) {
        _m_vehicle->setSteeringValue(gVehicleSteering, 0);
        _m_vehicle->setSteeringValue(gVehicleSteering, 1);
    } else {
        
    }
}

@end
