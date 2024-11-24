//
//  Player.swift
//  hac-man
//
//  Created by Janet Guan on 11/23/24.
//
import SpriteKit
import AppKit

class Player: SKSpriteNode {
    
    var alive: Bool = true
    var xVelocity: Double
    var yVelocity: Double
    var playerSpeed: Double
    let textureAtlas = SKTextureAtlas(named: "Pacman Sprite Atlas")
    var rightWalkTextures = [SKTexture]()
    var leftWalkTextures = [SKTexture]()
    var upWalkTextures = [SKTexture]()
    var downWalkTextures = [SKTexture]()
    
    init(xVelocity: Double, yVelocity: Double, playerSpeed: Double) {
        let texture = SKTexture(imageNamed: "pacman1")
        self.xVelocity = xVelocity
        self.yVelocity = yVelocity
        self.playerSpeed = playerSpeed
        super.init(texture: texture, color: NSColor.clear,size: texture.size())
        textureFill()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func textureFill() {
        leftWalkTextures = [textureAtlas.textureNamed("pacmanL1"), textureAtlas.textureNamed("pacmanL2"), ]
        rightWalkTextures = [textureAtlas.textureNamed("pacmanR1"), textureAtlas.textureNamed("pacmanR2"), ]
        upWalkTextures = [textureAtlas.textureNamed("pacmanU1"), textureAtlas.textureNamed("pacmanU2"), ]
        downWalkTextures = [textureAtlas.textureNamed("pacmanD1"), textureAtlas.textureNamed("pacmanD2"), ]
        for texture in leftWalkTextures {
            texture.size()
            texture.filteringMode = .nearest
        }
        for texture in rightWalkTextures {
            texture.size()
            texture.filteringMode = .nearest
        }
        for texture in upWalkTextures {
            texture.size()
            texture.filteringMode = .nearest
        }
        for texture in downWalkTextures {
            texture.size()
            texture.filteringMode = .nearest
        }
    }
}
