//
//  CPHYKinematicCharacterController.m
//  PhyKit
//
//  Created by Aditya JS on 09/04/24.
//

#import "CPHYRigidBody.h"
#import "CPHYRigidBody+Internal.h"
#import "CPHYKinematicCharacterController.h"
#import "CPHYKinematicCharacterController+Internal.h"
#import "CPHYCollisionShape.h"
#import "CPHYCollisionShape+Internal.h"
#import "CPHYWorld.h"
#import "CPHYWorld+Internal.h"
#import "CPHYStructs.h"
#import "CPHYDependencies+Internal.h"
#import "CPHYStructs+Internal.h"

@interface CPHYKinematicCharacterController() {
    
}

@end

@implementation CPHYKinematicCharacterController {}

-(instancetype)initWithEntity:(CPHYRigidBody *)rigidBody shapeRadius:(float)radius shapeHeight:(float)height stepHeight:(float)stepHeight world:(CPHYWorld*)world {
    self = [super init];
    if (self) {
        
        _playerGhostObject = new btPairCachingGhostObject();
        _playerGhostObject->setWorldTransform(rigidBody.c_body->getWorldTransform());
        
        _playerShape = new btCapsuleShape(radius, height);
        
        _playerGhostObject->setCollisionShape(_playerShape);
        _playerGhostObject->setCollisionFlags(btCollisionObject::CF_CHARACTER_OBJECT);
        
        _characterController =  new btKinematicCharacterController(_playerGhostObject, _playerShape, btScalar(stepHeight));
        
        world.world->addCollisionObject(_playerGhostObject, btBroadphaseProxy::CharacterFilter, btBroadphaseProxy::AllFilter);
        world.world->addAction(_characterController);
    }
    
    return self;
}

-(void) setWalkDirection:(PHYVector3)direction {
    _characterController->setWalkDirection(btVector3(direction.x, direction.y, direction.z));
}

-(void) jump:(float)jumpSpeed {
    _characterController->setJumpSpeed(btScalar(jumpSpeed));
    _characterController->jump(btVector3(0, 25, 0));
}

@end
