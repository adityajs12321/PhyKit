//
//  CPHYCharacterController.m
//  PhyKit
//
//  Created by Sunil390 on 09/08/23.
//

#import "CPHYRigidBody.h"
#import "CPHYRigidBody+Internal.h"
#import "CPHYCharacterController.h"
#import "CPHYCharacterController+Internal.h"
#import "CPHYWorld.h"
#import "CPHYWorld+Internal.h"
#import "CPHYStructs.h"
#import "CPHYDependencies+Internal.h"
#import "CPHYStructs+Internal.h"

@interface CPHYCharacterController() {
    btVector3 currentDirection;
    btVector3 linearVelocity;
    btVector3 angularVelocity;
    float pMoveSpeed;
}

@end

@implementation CPHYCharacterController {}

-(instancetype)initWithEntity: (CPHYRigidBody*)rigidBody moveSpeed: (float) moveSpeed {
    self = [super init];
    if (self) {
        _entity = rigidBody.c_body;
        pMoveSpeed = moveSpeed;
    }
    return self;
}

-(void)move: (PHYVector3)forward direction: (float) direction {
    linearVelocity = btVector3(forward.x, forward.y, forward.z) * direction * pMoveSpeed;
    _entity->applyCentralImpulse(linearVelocity);
}

-(void)turn: (float) direction {
    angularVelocity = btVector3(0, direction, 0);
    _entity->setAngularVelocity(angularVelocity);
}

-(void)resetVelocity {
    linearVelocity = btVector3(0, 0, 0);
    angularVelocity = btVector3(0, 0, 0);
}

@end
