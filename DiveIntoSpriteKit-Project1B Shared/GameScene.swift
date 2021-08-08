//
//  GameScene.swift
//  DiveIntoSpriteKit-Project1B Shared
//
//  Created by David Malicke on 8/5/21.
//
import GameplayKit
import SpriteKit

class GameScene: SKScene {
    
    let player = SKSpriteNode(imageNamed: "player-rocket")
    let controlUp = SKSpriteNode(imageNamed: "coin")
    let controlDown = SKSpriteNode(imageNamed: "coin")
    
    var touchingControlUp = false
    var touchingControlDown = false
    
    var touchingPlayer = false
    
    class func newGameScene() -> GameScene {
        // Load 'GameScene.sks' as an SKScene.
        guard let scene = SKScene(fileNamed: "GameScene") as? GameScene else {
            print("Failed to load GameScene.sks")
            abort()
        }
        
        // Set the scale mode to scale to fit the window
        scene.scaleMode = .aspectFill
        
        return scene
    }
    
    
    
    
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "space.jpg")
        background.zPosition = -1
        addChild(background)
        
        player.position.x = -400
        player.zPosition = 1
        addChild(player)
        
        controlUp.position.x = -100
        controlUp.zPosition = 1
        addChild(controlUp)
        
        controlDown.position.x = -200
        controlDown.zPosition = 1
        addChild(controlDown)
        
        if let particles = SKEmitterNode(fileNamed: "SpaceDust") {
            particles.advanceSimulationTime(10)
            particles.position.x = 512
            addChild(particles)
        }
        
    }
    
    
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

// Touch-based event handling
extension GameScene {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        findPlayer(touches)
        movePlayerUp()
        movePlayerDown()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        trackPlayer(touches)
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        touchingPlayer = false
        touchingControlUp = false
        touchingControlDown = false
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        touchingPlayer = false
        touchingControlUp = false
        touchingControlDown = false
    }
    
}




