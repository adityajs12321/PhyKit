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

-(instancetype)initWithRigidBody1: (CPHYRigidBody *)rigidBody1 rigidBody2: (CPHYRigidBody *)rigidBody2 frameInA: (struct PHYMatrix4)frameInA frameInB: (struct PHYMatrix4)frameInB useLinearReferenceFrameA: (BOOL)useLinearReferenceFrameA angularLowerLimit:(struct PHYVector3)angularLowerLimit angularUpperLimit:(struct PHYVector3)angularUpperLimit{
    self = [super init];
    if (self) {
        _rigidBody1 = rigidBody1.c_body;
        _rigidBody2 = rigidBody2.c_body;
        
        btTransform frameA = btTransformMakeFrom(frameInA);
        btTransform frameB = btTransformMakeFrom(frameInB);
        
        _constraint = new btGeneric6DofConstraint(*_rigidBody1, *_rigidBody2, frameA, frameB, useLinearReferenceFrameA);
        
        btVector3 aLL = btVector3(angularLowerLimit.x, angularLowerLimit.y, angularLowerLimit.z);
        btVector3 aUL = btVector3(angularUpperLimit.x, angularUpperLimit.y, angularUpperLimit.z);
        _constraint->setAngularLowerLimit(aLL);
        _constraint->setAngularLowerLimit(aUL);
        _constraint->setLinearLowerLimit(btVector3(0, 0, 0));
        _constraint->setLinearUpperLimit(btVector3(0, 0, 0));
        
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
