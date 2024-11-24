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
    let blinky = Ghost(sprite: SKTexture(imageNamed: "bluGhost"), xVelocity: 0, yVelocity: 0, playerSpeed: Int.random(in: 1...5), isAlive: true)
    let yinky = Ghost(sprite: SKTexture(imageNamed: "yellowGhost"), xVelocity: 0, yVelocity: 0, playerSpeed: Int.random(in: 1...5), isAlive: true)
    let rinky = Ghost(sprite: SKTexture(imageNamed: "redGhost"), xVelocity: 0, yVelocity: 0, playerSpeed: Int.random(in: 1...5), isAlive: true)
    let ginky = Ghost(sprite: SKTexture(imageNamed: "greenGhost"), xVelocity: 0, yVelocity: 0, playerSpeed: Int.random(in: 1...5), isAlive: true)
    var rightAnimation = SKAction()
    var leftAnimation = SKAction()
    var upAnimation = SKAction()
    var downAnimation = SKAction()
    
    func pathViable(nextPixelColumn: Int, nextPixelRow: Int, tileMap: [[[Int]]]) -> Bool {
        let tileSize: CGFloat = 16
        let nextTileColumn = nextPixelColumn/16
        let nextTileRow = nextPixelRow/16
        guard nextTileColumn >= 0 && nextTileColumn < 18 && nextTileRow >= 0 && nextTileRow < 24 else {
            return false
        }
//        guard tileMap[nextTileRow][nextTileColumn] == 0 else {
//            return false
//        }
        return true;
    }
    
    override func didMove(to view: SKView) {
        rightAnimation = SKAction.animate(with: pacman.rightWalkTextures, timePerFrame: 0.2)
        leftAnimation = SKAction.animate(with: pacman.leftWalkTextures, timePerFrame: 0.2)
        upAnimation = SKAction.animate(with: pacman.upWalkTextures, timePerFrame: 0.2)
        downAnimation = SKAction.animate(with: pacman.downWalkTextures, timePerFrame: 0.2)
        
        let possibleDirections: [CGVector] = [
            CGVector(dx: 1, dy: 0),  // Right
            CGVector(dx: -1, dy: 0), // Left
            CGVector(dx: 0, dy: 1),  // Up
            CGVector(dx: 0, dy: -1)  // Down
        ]
        let tileSize: CGFloat = 16
        var randomDuration = Double.random(in: 1...10)
        let moveAction = SKAction.moveBy(x: possibleDirections.randomElement()!.dx * tileSize, y: possibleDirections.randomElement()!.dy * tileSize, duration: randomDuration)
        
        backgroundColor = SKColor.black
        pacman.position = CGPoint(x: size.width / 2, y: size.height / 2)
        pacman.setScale(0.5)
        pacman.physicsBody = SKPhysicsBody(circleOfRadius:8)
        pacman.physicsBody?.isDynamic = false
        addChild(pacman)
        
        blinky.position = CGPoint(x: size.width / 2, y: size.height / 2)
        rinky.position  = CGPoint(x: size.width / 2, y: size.height / 2)
        yinky.position = CGPoint(x: size.width / 2, y: size.height / 2)
        ginky.position = CGPoint(x: size.width / 2, y: size.height / 2)
        
        addChild(blinky)
        addChild(rinky)
        addChild(yinky)
        addChild(ginky)
        blinky.moveGhost()
        rinky.moveGhost()
        yinky.moveGhost()
        ginky.moveGhost()
        
        blinky.run(SKAction.repeatForever(moveAction))
        rinky.run(SKAction.repeatForever(moveAction))
        yinky.run(SKAction.repeatForever(moveAction))
        ginky.run(SKAction.repeatForever(moveAction))
        
        if pacman.xVelocity < 0 {
            pacman.run(SKAction.repeatForever(leftAnimation))
        } else if pacman.xVelocity > 0 {
            pacman.run(SKAction.repeatForever(rightAnimation))
        } else if pacman.yVelocity < 0 {
            pacman.run(SKAction.repeatForever(downAnimation))
        } else if pacman.yVelocity > 0 {
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
       
        case 124:
            pacman.run(SKAction.repeatForever(rightAnimation))
            
        case 125:
            pacman.run(SKAction.repeatForever(downAnimation))
           
        case 126:
            pacman.run(SKAction.repeatForever(upAnimation))
            
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
}
