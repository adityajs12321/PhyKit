//
//  PHYConstraint.swift
//  PhyKit
//
//  Created by Sunil390 on 03/04/23.
//

import Foundation

public class PHYConstraint: CPHYConstraint {
    
    public init(rigidBody1: PHYRigidBody, rigidBody2: PHYRigidBody, frameInA: PHYMatrix4, frameInB: PHYMatrix4, useLinearReferenceFrameA: Bool, angularLowerLimit: PHYVector3, angularUpperLimit: PHYVector3) {
        super.init(rigidBody1: rigidBody1, rigidBody2: rigidBody2, frameInA: frameInA, frameInB: frameInB, useLinearReferenceFrameA: useLinearReferenceFrameA, angularLowerLimit: angularLowerLimit, angularUpperLimit: angularUpperLimit)
    }
    
}
