//
//  Ghost.swift
//  hac-man
//
//  Created by Janet Guan on 11/23/24.
//

import SpriteKit

class Ghost: SKSpriteNode {
    
    private var alive: Bool = true
    private var xVelocity: Int
    private var yVelocity: Int
    private var ghostSpeed: Int
    
    func getAlive() -> Bool {
        return alive
    }
    
    func getX() -> Int {
        return xVelocity
    }
    
    func getY() -> Int {
        return yVelocity
    }
    
    func setxVelocity(xVelocity: Int) {
        self.xVelocity = xVelocity*self.ghostSpeed
    }
    
    func setyVelocity(yVelocity: Int) {
        self.yVelocity = yVelocity*self.ghostSpeed
    }
    
    func setGhostSpeed(ghostSpeed: Int) {
        self.ghostSpeed = ghostSpeed
    }
    
    func setAlive(alive: Bool) {
        self.alive = alive;
    }
    
    init(sprite: SKTexture, xVelocity: Int, yVelocity: Int, playerSpeed: Int, isAlive: Bool) {
        self.ghostSpeed = Int.random(in: 1...5)
        self.xVelocity = xVelocity
        self.yVelocity = yVelocity
        self.alive = true
        super.init(texture: sprite, color: NSColor.clear, size: sprite.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func moveGhost() {
        let possibleDirections: [CGVector] = [
            CGVector(dx: 1, dy: 0),  // Right
            CGVector(dx: -1, dy: 0), // Left
            CGVector(dx: 0, dy: 1),  // Up
            CGVector(dx: 0, dy: -1)  // Down
        ]
        var randomDirection = possibleDirections.randomElement()!
        var randomDuration = Double.random(in: 1...10)
        let tileSize: CGFloat = 16
        let moveAction = SKAction.moveBy(x: randomDirection.dx * tileSize, y: randomDirection.dy * tileSize, duration: randomDuration)
    }
}
