//
//  CPHYConstraint+Internal.h
//  PhyKit
//
//  Created by Sunil390 on 03/04/23.
//

#ifndef CPHYConstraint_Internal_h
#define CPHYConstraint_Internal_h

#import "CPHYDependencies+Internal.h"

@class CPHYRigidBody;
@class CPHYWorld;

@interface CPHYConstraint ()

@property (nonatomic, readonly) btRigidBody* rigidBody1;
@property (nonatomic, readonly) btRigidBody* rigidBody2;
@property (nonatomic, readonly) btGeneric6DofConstraint* constraint;
@property (nonatomic, weak) CPHYWorld* physicsWorld;

@end

#endif /* CPHYConstraint_Internal_h */
