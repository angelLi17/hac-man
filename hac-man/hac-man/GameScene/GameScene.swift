//
//  GameScene.swift
//  hac-man
//
//  Created by Neya on 11/23/24.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var pacman = SKSpriteNode(imageNamed: "pacman1")
    private var playerXVelocity: CGFloat = 0
    private var playerYVelocity: CGFloat = 0
    private var playerSpeed = 3.0

    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black
        pacman.position = CGPoint(x: size.width / 2, y: size.height / 2)
        pacman.texture?.filteringMode = .nearest
        pacman.setScale(5)
        pacman.physicsBody = SKPhysicsBody(circleOfRadius:8)
        pacman.physicsBody?.isDynamic = false
        addChild(pacman)
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func mouseDown(with event: NSEvent) {
        self.touchDown(atPoint: event.location(in: self))
    }
    
    override func mouseDragged(with event: NSEvent) {
        self.touchMoved(toPoint: event.location(in: self))
    }
    
    override func mouseUp(with event: NSEvent) {
        self.touchUp(atPoint: event.location(in: self))
    }
    
    override func keyDown(with event: NSEvent) {
        switch event.keyCode {
        case 123:
            playerXVelocity = -1
            playerYVelocity = 0
        case 124:
            playerXVelocity = 1
            playerYVelocity = 0
        case 125:
            playerYVelocity = -1
            playerXVelocity = 0
        case 126:
            playerYVelocity = 1
            playerXVelocity = 0
        case 0x31:
            print("case 0x31")
        default:
            print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        pacman.position.x += playerXVelocity * playerSpeed
        pacman.position.y += playerYVelocity * playerSpeed
    }

    func dots() {
        
    }
}
