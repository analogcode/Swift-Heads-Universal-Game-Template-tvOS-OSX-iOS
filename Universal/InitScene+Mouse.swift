//
//  InitScene+Mouse.swift
//  Universal Game Template
//
//  Created by Matthew Fecher on 12/13/15.
//  Copyright © 2015 Denver Swift Heads. All rights reserved.
//

import Foundation
import SpriteKit

extension InitScene {
    
    // ****************************************************
    // MARK: - Mouse click/drag to userInteraction
    // ****************************************************
    
    override func mouseDown(theEvent: NSEvent) {
       let mouseLocation = theEvent.locationInNode(self)
       userInteractionBegan(mouseLocation)
    }
    
    override func mouseDragged(theEvent: NSEvent) {
        let mouseLocation = theEvent.locationInNode(self)
        userInteractionMoved(mouseLocation)
    }
    
    override func mouseUp(theEvent: NSEvent) {
        let mouseLocation = theEvent.locationInNode(self)
        userInteractionEnded(mouseLocation)
    }
    
}
