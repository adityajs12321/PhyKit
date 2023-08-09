//
//  CPHYCharacterController.h
//  PhyKit
//
//  Created by Sunil390 on 09/08/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

struct PHYVector3;
@class CPHYRigidBody;

@interface CPHYCharacterController : NSObject

-(instancetype)initWithEntity: (CPHYRigidBody*)rigidBody moveSpeed: (float) moveSpeed;

-(void)move: (struct PHYVector3)forward direction: (float) direction;

-(void)turn: (float) direction;

-(void)resetVelocity;

@end

NS_ASSUME_NONNULL_END
