//
//  CPHYKinematicCharacterController+Internal.h
//  PhyKit
//
//  Created by Aditya JS on 09/04/24.
//

#ifndef CPHYKinematicCharacterController_Internal_h
#define CPHYKinematicCharacterController_Internal_h

#import "CPHYDependencies+Internal.h"

@class CPHYKinematicCharacterController;

@interface CPHYKinematicCharacterController ()

@property (nonatomic, assign) btPairCachingGhostObject* playerGhostObject;
@property (nonatomic, assign) btCapsuleShape* playerShape;
@property (nonatomic, assign) btKinematicCharacterController* characterController;

@end

#endif /* CPHYKinematicCharacterController_Internal_h */
