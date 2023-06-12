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
struct PHYMatrix4;
struct PHYVector3;

@interface CPHYRaycastVehicle : NSObject

@property (nonatomic, readonly) NSMutableArray* lmfao;

-(instancetype)initWithChassisShape: (CPHYCollisionShape *)chassisShape world: (CPHYWorld *)world mass:(float)mass wheelWidth:(float)wheelWidth wheelRadius:(float)wheelRadius maxEngineForce:(float)maxEngineForce maxBreakingForce:(float)maxBreakingForce wheelFriction:(float)wheelFriction suspensionStiffness:(float)suspensionStiffness suspensionDamping:(float)suspensionDamping suspensionCompression:(float)suspensionCompression suspensionRestLength:(float)suspensionRestLength rollInfluence:(float)rollInfluence;

-(struct PHYMatrix4) getWheelPositions:(int)wheelIndex;
-(struct PHYMatrix4) getChassisPosition;
-(void) applyVehicleEngineForce:(float)gEngineForce breakingForce:(float)gBreakingForce;
-(void) vehicleSteeringValue:(float)gVehicleSteering;
-(struct PHYVector3) eulerOrientation;
-(void) setEulerOrientation:(struct PHYVector3)eulerOrientation;

@end

NS_ASSUME_NONNULL_END
