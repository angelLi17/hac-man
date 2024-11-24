//
//  Ghost.swift
//  hac-man
//
//  Created by Janet Guan on 11/23/24.
//

import SpriteKit

public class Ghost: SKSpriteNode {
    
    private var alive: Bool = true
    private var sprite: SKSpriteNode
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
    
    init(sprite: SKSpriteNode, xVelocity: Int, yVelocity: Int, playerSpeed: Int, isAlive: Bool) {
        self.xVelocity = xVelocity
        self.yVelocity = yVelocity
        self.ghostSpeed = Double: random(in:1,5)
        self.sprite = sprite
        self.alive = true
        
    }
    func moveGhost(ghost: Ghost){
        let possibleDirections: [CGVector] = [
            CGVector(dx: 1, dy: 0),  // Right
            CGVector(dx: -1, dy: 0), // Left
            CGVector(dx: 0, dy: 1),  // Up
            CGVector(dx: 0, dy: -1)  // Down
        ]
        while true {
            let randomDirection = possibleDirections.randomElement()!
            let randomDuration = Double.random(in: 1...10)
        }
        let tileSize: CGFloat = 16
        let moveAction = SKAction.moveBy(x: randomDirection.dx * tileSize,
                                             y: randomDirection.dy * tileSize,
                                             duration: randomDuration)
    }
}
