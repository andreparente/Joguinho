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
    var spaceShipName:SpaceShipName!
    var fuelLevel:Double!
    
    
    init(fuelLevel:Double,spaceShipName:SpaceShipName) {
        self.fuelLevel  = fuelLevel
        self.spaceShipName = spaceShipName
        if spaceShipName == SpaceShipName.standardSpaceShip {
        self.fire = SKSpriteNode(imageNamed: "fire_1")
        }
        super.init(imageNamed: self.spaceShipName.rawValue)
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
        self.position = CGPoint(x: 100, y: 150)
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
        self.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        let vector = CGVector(dx: 2, dy: 8)
        self.physicsBody?.applyImpulse(vector)
        self.updateDirectionTo(vector: vector)
    }
    
    func winningMove() {
        let wait = SKAction.wait(forDuration: 0.2)
        self.run(wait)
        
        self.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        let vector = CGVector(dx: 6, dy: 10)
        self.physicsBody?.applyImpulse(vector)
        self.updateDirectionTo(vector: vector)
        self.fireMovement()
    }
    
    func drag() {
        let vector = CGVector(dx: -0.06, dy: 0)
        self.physicsBody?.applyImpulse(vector)
        self.updateDirectionTo(vector: CGVector(dx: -0.05, dy: 0.05))
    }
    
    func dragWhenPassedThreeQuartersOfScreen () {
        let vector = CGVector(dx: -0.1, dy: 0)
        self.physicsBody?.applyImpulse(vector)
        self.updateDirectionTo(vector: vector)
    }
    func collidedWithRock() {
        let vector = CGVector(dx: -1, dy: -2)
        self.physicsBody?.applyImpulse(vector)
        //self.updateDirectionTo(vector: vector)
    }
    
    func updateDirectionTo(vector: CGVector) {
        let angle = atan2(vector.dx, vector.dy)
        var action = SKAction.init(named: "rotate")
        action = SKAction.rotate(toAngle: angle, duration: 0.8)
        self.run(action!)
        //self.removeAction(forKey: "rotate")
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

