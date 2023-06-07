//
//  PHYStructs+Internal.h
//  BulletPhysics
//
//  Created by Adam Eisfeld on 2020-06-13.
//  Copyright © 2020 adam. All rights reserved.
//

#ifndef BLStructs_Internal_h
#define BLStructs_Internal_h

#import "CPHYDependencies+Internal.h"

struct PHYMatrix4;

#ifdef __cplusplus
extern "C" {
#endif


#ifdef __cplusplus
}
#endif

extern struct PHYMatrix4 PHYMatrix4MakeFrom(btTransform c_transform);
extern struct PHYMatrix4 PHYMatrix4MakeFromBTScalar(btScalar matrix[16]);
extern struct btTransform btTransformMakeFrom(PHYMatrix4 transform);
extern struct btTransform btTransformMakeFrom(PHYMatrix4 transform);

#endif /* BLStructs_Internal_h */
