//
//  CPHYRaycastVehicle.h
//  PhyKit
//
//  Created by Sunil390 on 06/06/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class CPHYCollisionShape;
@class CPHYWorld;
@class CPHYRigidBody;

@interface CPHYRaycastVehicle : NSObject

@property (nonatomic, readonly) NSMutableArray* lmfao;

-(instancetype)initWithChassisShape: (CPHYCollisionShape *)chassis_shape world: (CPHYWorld *)world rigidbody: (CPHYRigidBody *)rigidbody lmfao:(CPHYCollisionShape *)lmfao mass:(float)mass wheelWidth:(float)wheelWidth wheelRadius:(float)wheelRadius gEngineForce:(float)gEngineForce gBreakingForce:(float)gBreakingForce maxEngineForce:(float)maxEngineForce maxBreakingForce:(float)maxBreakingForce gVehicleSteeering:(float)gVehicleSteeering steeringIncrement:(float)steeringIncrement steeringClamp:(float)steeringClamp wheelFriction:(float)wheelFriction suspensionStiffness:(float)suspensionStiffness suspensionDamping:(float)suspensionDamping suspensionCompression:(float)suspensionCompression suspensionRestLength:(float)suspensionRestLength rollInfluence:(float)rollInfluence;

@end

NS_ASSUME_NONNULL_END
