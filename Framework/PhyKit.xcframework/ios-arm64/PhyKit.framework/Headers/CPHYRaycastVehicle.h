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

-(instancetype)initWithChassisShape: (CPHYCollisionShape *)chassis_shape world: (CPHYWorld *)world mass:(float)mass wheelWidth:(float)wheelWidth wheelRadius:(float)wheelRadius maxEngineForce:(float)maxEngineForce maxBreakingForce:(float)maxBreakingForce wheelFriction:(float)wheelFriction suspensionStiffness:(float)suspensionStiffness suspensionDamping:(float)suspensionDamping suspensionCompression:(float)suspensionCompression suspensionRestLength:(float)suspensionRestLength rollInfluence:(float)rollInfluence;

@end

NS_ASSUME_NONNULL_END
