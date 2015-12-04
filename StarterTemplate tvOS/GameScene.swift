//
//  GameScene.swift
//  StarterTemplate tvOS
//
//  Created by Matthew Fecher on 12/4/15.
//  Copyright (c) 2015 Denver Swift Heads. All rights reserved.
//

import SpriteKit

class GameScene: InitScene {
   
    // ***********************************************
    // MARK - didMoveToView
    // ***********************************************
    
    override func didMoveToView(view: SKView) {
        setupScene()
    }
    
    // ***********************************************
    // MARK - User Interaction
    // ***********************************************
    
    override func userInteractionBegan(location: CGPoint) {
        addSpaceship(location)
    }
    
    override func userInteractionMoved(location: CGPoint) {
    }
    
    override func userInteractionEnded(location: CGPoint) {
    }
   
    // ***********************************************
    // MARK - Update (aka the game loop)
    // ***********************************************
    
    override func update(currentTime: CFTimeInterval) {
        // Called before each frame is rendered
    }
    
    // ***********************************************
    // MARK - Demo Code, can be deleted
    // ***********************************************
    
    func setupScene() {
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, World!";
        myLabel.fontSize = 65;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        self.addChild(myLabel)
    }
    
    func addSpaceship(location: CGPoint) {
        let sprite = SKSpriteNode(imageNamed:"Spaceship")
        
        sprite.xScale = 0.5
        sprite.yScale = 0.5
        sprite.position = location
        
        let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
        
        sprite.runAction(SKAction.repeatActionForever(action))
        
        self.addChild(sprite)
    }
}
