//
//  Spaceship.swift
//  Joguinho
//
//  Created by Andre Machado Parente on 10/21/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import Foundation
import SpriteKit

class Spaceship:Component {
    
    var TextureAtlas = SKTextureAtlas()
    var TextureArray = [SKTexture]()
    var fire = SKSpriteNode()
    
    var fuelLevel:Int!
    
    
    init(fuelLevel:Int) {
        self.fuelLevel  = fuelLevel
        self.fire = SKSpriteNode(imageNamed: "fire_1")
        super.init(imageNamed: "rocket fase")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changePieces() {
        
    }
    
    func increaseFuelLevel() {
        self.fuelLevel = self.fuelLevel + 10
    }
    func decreaseFuelLevel() {
        self.fuelLevel = self.fuelLevel - 2
    }
    
    func startMoment() {
        self.position = CGPoint(x: 70, y: 150)
        self.zPosition = 10
        self.physicsBody?.affectedByGravity = true
        self.physicsBody?.isDynamic = true
        self.physicsBody?.usesPreciseCollisionDetection = true
        self.physicsBody = SKPhysicsBody(texture: self.texture!,
                                         size: CGSize(width: self.size.width, height: self.size.height))
        self.physicsBody?.categoryBitMask = CollisionTypes.player.rawValue
        self.physicsBody?.contactTestBitMask = CollisionTypes.rock.rawValue | CollisionTypes.fuelDrop.rawValue | CollisionTypes.gem.rawValue
        self.physicsBody?.collisionBitMask = CollisionTypes.rock.rawValue
        
    }
    
    func spaceshipMovement() {
        let spaceshipMove = SKAction.applyImpulse(CGVector(dx: 0, dy: 1), duration: 0.1)
        self.run(spaceshipMove)
    }
    
    func fireMovement() {

        TextureAtlas = SKTextureAtlas (named: "fire")
        for i in 1...TextureAtlas.textureNames.count{
            let name = "fire_\(i).png"
            TextureArray.append(SKTexture(imageNamed: name))
        }
        fire = SKSpriteNode(imageNamed: TextureAtlas.textureNames[0])
        let action = SKAction.repeatForever(SKAction.animate(with: TextureArray, timePerFrame: 0.1))
        fire.run(action, withKey: "fireMovement")
        fire.position = CGPoint (x: -40, y: -5)
        fire.zPosition = -1
        addChild(fire)
    }
}
