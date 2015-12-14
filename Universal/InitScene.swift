//
//  DefaultScene.swift
//  Universal Game Template
//
//  Created by Matthew Fecher on 12/4/15.
//  Copyright © 2015 Denver Swift Heads. All rights reserved.
//

import SpriteKit

class InitScene: SKScene {
    
    // ****************************************************
    // MARK: - Universal User Interaction
    // ****************************************************
    
    // These functions are overridden by subclasses
    // and suplimented by extensions ("Interaction Extensions" group).
    
    // iOS | tvOS | OS/X have different user interactions.
    // By abstracting out, it opens the door to easily add
    // interactions and platforms (e.g. such as OS/X mouse/keyboard)
    
    func userInteractionBegan(location: CGPoint) {
        // Universal interaction began (touches, clicks, etc)
    }
    
    func userInteractionMoved(location: CGPoint) {
        // Universal interaction moved (touches, clicks, etc)
    }
    
    func userInteractionEnded(location: CGPoint) {
        // Universal interaction ended (touches, clicks, etc)
    }
    
}
