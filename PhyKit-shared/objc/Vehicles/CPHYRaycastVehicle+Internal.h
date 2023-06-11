//
//  CPHYRaycastVehicle+Internal.h
//  PhyKit
//
//  Created by Sunil390 on 06/06/23.
//

#ifndef CPHYRaycastVehicle_Internal_h
#define CPHYRaycastVehicle_Internal_h

#import "CPHYDependencies+Internal.h"

@interface CPHYRaycastVehicle ()

@property (nonatomic, readonly) btRaycastVehicle* vehicle;
@property (nonatomic, assign) btScalar suspensionRestLength;
@property (nonatomic, readonly) btRaycastVehicle::btVehicleTuning tuning;
@property (nonatomic, readonly) btRigidBody* m_carChassis;
@property (nonatomic, readonly) btCollisionShape* m_wheelShape;
@property (nonatomic, readonly) btVehicleRaycaster* m_vehicleRaycaster;
@property (nonatomic, readonly) btRaycastVehicle* m_vehicle;

-(void) applyEngineForce:(btScalar)gEngineForce breakingForce:(btScalar)gBreakingForce;
-(void) steeringValue:(btScalar)gVehicleSteering;

@end

#endif /* CPHYRaycastVehicle_Internal_h */
