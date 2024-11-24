//
//  GameScene.swift
//  hac-man
//
//  Created by Neya on 11/23/24.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var pacman = Player(xVelocity: 0,yVelocity: 1,playerSpeed: 2.0)
    var rightAnimation = SKAction()
    var leftAnimation = SKAction()
    var upAnimation = SKAction()
    var downAnimation = SKAction()
    
    override func didMove(to view: SKView) {
        rightAnimation = SKAction.animate(with: pacman.rightWalkTextures, timePerFrame: 0.2)
        leftAnimation = SKAction.animate(with: pacman.leftWalkTextures, timePerFrame: 0.2)
        upAnimation = SKAction.animate(with: pacman.upWalkTextures, timePerFrame: 0.2)
        downAnimation = SKAction.animate(with: pacman.downWalkTextures, timePerFrame: 0.2)
        backgroundColor = SKColor.black
        pacman.position = CGPoint(x: size.width / 2, y: size.height / 2)
        pacman.setScale(0.5)
        pacman.physicsBody = SKPhysicsBody(circleOfRadius:8)
        pacman.physicsBody?.isDynamic = false
        addChild(pacman)
        
        if pacman.xVelocity == -1 {
            pacman.run(SKAction.repeatForever(leftAnimation))
        } else if pacman.xVelocity == 1 {
            pacman.run(SKAction.repeatForever(rightAnimation))
        } else if pacman.yVelocity == -1 {
            pacman.run(SKAction.repeatForever(downAnimation))
        } else if pacman.yVelocity == 1 {
            pacman.run(SKAction.repeatForever(upAnimation))
        }
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
            pacman.run(SKAction.repeatForever(leftAnimation))
            pacman.xVelocity = -1
            pacman.yVelocity = 0
        case 124:
            pacman.run(SKAction.repeatForever(rightAnimation))
            pacman.xVelocity = 1
            pacman.yVelocity = 0
        case 125:
            pacman.run(SKAction.repeatForever(downAnimation))
            pacman.xVelocity = 0
            pacman.yVelocity = -1
        case 126:
            pacman.run(SKAction.repeatForever(upAnimation))
            pacman.xVelocity = 0
            pacman.yVelocity = 1
        case 0x31:
            print("case 0x31")
        default:
            print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        pacman.position.x += pacman.xVelocity * pacman.playerSpeed
        pacman.position.y += pacman.yVelocity * pacman.playerSpeed
    }

    func dots() {
        
    }
}
