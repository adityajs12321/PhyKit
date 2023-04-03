//
//  CPHYConstraint.m
//  PhyKit
//
//  Created by Sunil390 on 03/04/23.
//

#import <Foundation/Foundation.h>
#import "CPHYConstraint.h"
#import "CPHYDependencies+Internal.h"
#import "CPHYRigidBody.h"
#import "CPHYRigidBody+Internal.h"
#import "CPHYConstraint+Internal.h"
#import "CPHYStructs+Internal.h"
#import "CPHYStructs.h"
#import "CPHYWorld.h"

@interface CPHYConstraint() {
    
}

@end

@implementation CPHYConstraint {}

-(instancetype)initWithRigidBody1: (CPHYRigidBody *)rigidBody1 rigidBody2: (CPHYRigidBody *)rigidBody2 frameInA: (PHYMatrix4)frameInA frameInB: (PHYMatrix4)frameInB disableCollisions: (BOOL)disableCollisions {
    self = [super init];
    if (self) {
        _rigidBody1 = rigidBody1.c_body;
        _rigidBody2 = rigidBody2.c_body;
        
        btTransform frameA = btTransformMakeFrom(frameInA);
        btTransform frameB = btTransformMakeFrom(frameInB);
        
        _constraint = new btGeneric6DofConstraint(*_rigidBody1, *_rigidBody2, frameA, frameB, disableCollisions);
    }
    return self;
}

- (void) dealloc {
    if (_constraint) {
        delete _constraint;
    }
    [_physicsWorld internalRemoveConstraint:self];
}

@end
