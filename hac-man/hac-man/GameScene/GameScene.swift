//
//  GameScene.swift
//  hac-man
//
//  Created by Neya on 11/23/24.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let pacman = SKSpriteNode(imageNamed: "pacman1");

    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black;
        pacman.position = CGPoint(x: size.width / 2, y: size.height / 2);
        pacman.setScale(0.5);
        pacman.physicsBody = SKPhysicsBody(circleOfRadius:8);
        addChild(pacman);
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
        case 0x31:
            print("case 0x31")
            
        default:
            print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }

    func dots() {
        
    }
}
