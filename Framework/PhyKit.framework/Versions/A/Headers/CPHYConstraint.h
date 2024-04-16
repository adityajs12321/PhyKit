//
//  CPHYConstraints.h
//  PhyKit
//
//  Created by Sunil390 on 03/04/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class CPHYRigidBody;
struct PHYMatrix4;

@interface CPHYConstraint : NSObject

-(instancetype)initWithRigidBody1: (CPHYRigidBody *)rigidBody1 rigidBody2: (CPHYRigidBody *)rigidBody2 frameInA: (struct PHYMatrix4)frameInA frameInB: (struct PHYMatrix4)frameInB useLinearReferenceFrameA: (BOOL)useLinearReferenceFrameA angularLowerLimit:(struct PHYVector3)angularLowerLimit angularUpperLimit:(struct PHYVector3)angularUpperLimit;

@end

NS_ASSUME_NONNULL_END


