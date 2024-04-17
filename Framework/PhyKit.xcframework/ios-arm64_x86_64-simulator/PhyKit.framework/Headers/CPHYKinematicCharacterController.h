//
//  CPHYKinematicCharacterController.h
//  PhyKit
//
//  Created by Aditya JS on 09/04/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

struct PHYVector3;
@class CPHYRigidBody;
@class CPHYWorld;

@interface CPHYKinematicCharacterController : NSObject

-(instancetype)initWithEntity: (CPHYRigidBody*)rigidBody shapeRadius:(float)radius shapeHeight:(float)height stepHeight: (float)stepHeight world:(CPHYWorld*)world;

-(void) setWalkDirection:(struct PHYVector3)direction;

-(void) jump:(float)jumpSpeed;

@end

NS_ASSUME_NONNULL_END
