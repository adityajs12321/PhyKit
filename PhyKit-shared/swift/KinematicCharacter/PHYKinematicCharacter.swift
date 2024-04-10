//
//  PHYKinematicCharacter.swift
//  PhyKit
//
//  Created by Aditya JS on 10/04/24.
//

import Foundation

public class PHYKinematicCharacter: CPHYKinematicCharacterController {
    public init(entity: PHYRigidBody, shapeRadius: Float, shapeHeight: Float, stepHeight: Float, world: PHYWorld) {
        super.init(entity: entity, shapeRadius: shapeRadius, shapeHeight: shapeHeight, stepHeight: stepHeight, world: world)
    }
}
