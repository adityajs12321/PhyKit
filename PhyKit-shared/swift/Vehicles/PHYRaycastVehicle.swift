//
//  PHYRaycastVehicle.swift
//  PhyKit
//
//  Created by Sunil390 on 08/06/23.
//

import Foundation

public class PHYRaycastVehicle: CPHYRaycastVehicle {
    public init(chassisShape: PHYCollisionShape, world: PHYWorld, mass: Float, wheelWidth: Float, wheelRadius: Float, maxEngineForce: Float, maxBreakingForce: Float, wheelFriction: Float, suspensionStiffness: Float, suspensionDamping: Float, suspensionCompression: Float, suspensionRestLength: Float, rollInfluence: Float) {
        super.init(chassisShape: chassisShape as! CPHYCollisionShape, world: world, mass: mass, wheelWidth: wheelWidth, wheelRadius: wheelRadius, maxEngineForce: maxEngineForce, maxBreakingForce: maxBreakingForce, wheelFriction: wheelFriction, suspensionStiffness: suspensionStiffness, suspensionDamping: suspensionDamping, suspensionCompression: suspensionCompression, suspensionRestLength: suspensionRestLength, rollInfluence: rollInfluence)
    }
}
