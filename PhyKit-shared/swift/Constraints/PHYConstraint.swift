//
//  PHYConstraint.swift
//  PhyKit
//
//  Created by Sunil390 on 03/04/23.
//

import Foundation

public class PHYConstraint: CPHYConstraint {
    
    public init(rigidBody1: PHYRigidBody, rigidBody2: PHYRigidBody, frameInA: PHYMatrix4, frameInB: PHYMatrix4, disableCollisionsBetweenLinkedBodies: Bool) {
        super.init(rigidBody1: rigidBody1, rigidBody2: rigidBody2, frameInA: frameInA, frameInB: frameInB, disableCollisions: disableCollisionsBetweenLinkedBodies)
    }
    
}
