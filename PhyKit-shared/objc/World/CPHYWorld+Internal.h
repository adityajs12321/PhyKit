//
//  CPHYWorld+Internal.h
//  PhyKit
//
//  Created by Sunil390 on 06/06/23.
//

#ifndef CPHYWorld_Internal_h
#define CPHYWorld_Internal_h

#import "CPHYDependencies+Internal.h"

@interface CPHYWorld ()

@property (nonatomic, readwrite) btDiscreteDynamicsWorld* world;
- (void)btInternalAddRigidBody: (btRigidBody *)btrigidbody;

@end

#endif /* CPHYWorld_Internal_h */
