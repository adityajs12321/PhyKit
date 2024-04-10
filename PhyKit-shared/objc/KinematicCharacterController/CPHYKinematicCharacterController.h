//
//  CPHYKinematicCharacterController.h
//  PhyKit
//
//  Created by Aditya JS on 09/04/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

struct PHYVector3;

@interface CPHYKinematicCharacterController : NSObject

@property (nonatomic, assign) btPairCachingGhostObject* playerGhostObject;
@property (nonatomic, assign) btCapsuleShape* playerShape;
@property (nonatomic, assign) btKinematicCharacterController* characterController;

-(instancetype)initWithEntity: (CPHYRigidBody*)rigidBody shapeRadius:(float)radius shapeHeight:(float)height stepHeight: (float)stepHeight world:(CPHYWorld*)world;

@end

NS_ASSUME_NONNULL_END
