//
//  GameScene.swift
//  StarterTemplate tvOS/iOS/OSX
//
//  Created by Matthew Fecher on 12/12/15.
//  Copyright (c) 2015 Denver Swift Heads. All rights reserved.
//

import SpriteKit

class GameScene: InitScene {
    
    // *************************************************************
    // Game States
    // *************************************************************
    
    enum GameState {
        case Tutorial
        case Play
    }
    
    // *************************************************************
    // Layers (zPosition)
    // *************************************************************
    
    enum Layer: CGFloat {
        case Background
        case Ground
        case Hero
        case UI
    }
    
    // *************************************************************
    // Physics Body Categories (bitwise)
    // *************************************************************
    
    struct PhysicsCategory {
        static let None: UInt32 =   1 << 0 // 00000000000000000000000000000001
        static let Hero: UInt32 =   1 << 1 // 00000000000000000000000000000010
        static let Ground: UInt32 = 1 << 2 // 00000000000000000000000000000100
    }
    
    // *************************************************************
    // MARK: - Constants & Properties
    // *************************************************************
    
    let kImpulse: CGFloat = 200.0
    var dt: NSTimeInterval = 0
    var lastUpdateTime: NSTimeInterval = 0
    var gameState: GameState = .Tutorial
    
    let worldNode = SKNode()
    let ship = SKSpriteNode(imageNamed:"Spaceship")

    // *************************************************************
    // MARK: - didMoveToView
    // *************************************************************
    
    override func didMoveToView(view: SKView) {
        
       
      
        setupScene()
    }
    
    // *************************************************************
    // MARK: - User Interaction
    // *************************************************************
    
    override func userInteractionBegan(location: CGPoint) {
        
        switch gameState {
        case .Tutorial:
            switchToPlayState()
            break
        case .Play:
            fireThrusters()
            break
        }
    }
    
    override func userInteractionMoved(location: CGPoint) {
     
    }
    
    override func userInteractionEnded(location: CGPoint) {
      
    }
    
    // ***********************************************
    // MARK: - Update (aka the Game Loop)
    // ***********************************************
    
    // update method is called before each frame is rendered
    override func update(currentTime: CFTimeInterval) {
        
        // Calculate delta time (dt) first
        if lastUpdateTime > 0 {
            dt = currentTime - lastUpdateTime
        } else {
            dt = 0
        }
        lastUpdateTime = currentTime
        
        // Determine update based on gameState
        switch gameState {
        case .Tutorial:
            // update code gets called here
            break
        case .Play:
            // update code gets called here
            break
        }
    }
    
    // *************************************************************
    // MARK: - Demo Setup Code - Can be deleted
    // *************************************************************
    
    // Setup Scenes/Nodes
    func setupScene() {
        setupWorld()
        setupBackground()
        setupGround()
        setupHero()
        setupTutorial()
    }
    
    func setupWorld() {
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        self.physicsWorld.gravity = CGVectorMake(0, -2.5);
        addChild(worldNode)
    }
    
    func setupBackground() {
        let background = SKSpriteNode(imageNamed: "Background")
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.zPosition = Layer.Background.rawValue
        worldNode.addChild(background)
    }
    
    func setupStarParticles() {
        let path = NSBundle.mainBundle().pathForResource("StarParticle", ofType: "sks")
        let starParticle = NSKeyedUnarchiver.unarchiveObjectWithFile(path!) as! SKEmitterNode
        
        starParticle.position = CGPointMake(self.size.width/2, self.size.height/2)
        starParticle.zPosition = Layer.Ground.rawValue
        worldNode.addChild(starParticle)
    }
    
    func setupGround() {
        let ground = SKSpriteNode(imageNamed: "Ground2")
        ground.zPosition = Layer.Ground.rawValue
        ground.position = CGPoint(x: size.width/2, y: ground.frame.height/4)
        
        // Add physics body for ground
        ground.physicsBody = SKPhysicsBody(rectangleOfSize: ground.size)
        ground.physicsBody?.dynamic = false
        ground.physicsBody?.categoryBitMask = PhysicsCategory.Ground
        ground.physicsBody?.collisionBitMask = PhysicsCategory.Hero
            
        worldNode.addChild(ground)
    }
    
    func setupHero() {
        ship.xScale = 0.5
        ship.yScale = 0.5
        ship.zPosition = Layer.Hero.rawValue
        ship.position = CGPoint(x: size.width/2, y: self.frame.height * 0.4)
        
        // Add physics body for Ship
        ship.physicsBody = SKPhysicsBody(rectangleOfSize: ship.size)
        ship.physicsBody?.categoryBitMask = PhysicsCategory.Hero
        ship.physicsBody?.collisionBitMask = PhysicsCategory.Ground
        
        // Ship starts out non-dynamic until Play starts
        ship.physicsBody?.dynamic = false
        
        worldNode.addChild(ship)
    }
    
    func setupTutorial() {
        let label = SKLabelNode(fontNamed:"AvenirNext-Regular ")
        label.zPosition = Layer.UI.rawValue
        label.text = "Ready, Player One!"
        label.fontSize = 36
        label.position = CGPoint(x: size.width/2, y: size.height * 0.6)
        label.name = "Tutorial"
        worldNode.addChild(label)
        
        let label2 = SKLabelNode(fontNamed:"AvenirNext-Regular ")
        label2.zPosition = Layer.UI.rawValue
        label2.text = "Tap or click to fire burst"
        label2.fontSize = 18
        label2.position = CGPoint(x: size.width/2, y: size.height * 0.55)
        label2.name = "Tutorial"
        worldNode.addChild(label2)
    }
    
    
    // *************************************************************
    // MARK: - Demo Gameplay Code - Can be deleted
    // *************************************************************
    
    func fireThrusters() {
        // Apply impulse
        ship.physicsBody?.velocity = CGVectorMake(0, kImpulse/2)
        ship.physicsBody?.applyImpulse(CGVectorMake(0, kImpulse))
    }
    
    // *************************************************************
    // MARK: - Game States
    // *************************************************************
    
    func switchToPlayState() {
        // switch gameState
        gameState = .Play
        
        // Make ship dynamic
        ship.physicsBody?.dynamic = true

        // Setup star particles
        setupStarParticles()
        
        // Remove Tutorial text
        worldNode.enumerateChildNodesWithName("Tutorial", usingBlock: { node, stop in
            node.runAction(SKAction.sequence([
                SKAction.fadeOutWithDuration(0.5),
                SKAction.removeFromParent()
                ]))
        })
    }
   

}
