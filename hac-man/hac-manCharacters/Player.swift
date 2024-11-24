//
//  Player.swift
//  hac-man
//
//  Created by Janet Guan on 11/23/24.
//
import SpriteKit

class Player: SKSpriteNode {
    
    private var alive: Bool = true
    private var sprite: SKSpriteNode
    private var xVelocity: Int
    private var yVelocity: Int
    private var playerSpeed: Int
    
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
        self.xVelocity = xVelocity
    }
    
    func setyVelocity(yVelocity: Int) {
        self.yVelocity = yVelocity
    }
    
    func setPlayerSpeed(playerSpeed: Int) {
        self.playerSpeed = playerSpeed
    }
    
    init(sprite: SKSpriteNode, xVelocity: Int, yVelocity: Int, playerSpeed: Int) {
        self.xVelocity = xVelocity
        self.yVelocity = yVelocity
        self.playerSpeed = playerSpeed
        self.sprite = sprite
    }
}
