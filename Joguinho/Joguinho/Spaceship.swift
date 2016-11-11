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
    
    var fuelLevel:Double!
    init(fuelLevel:Double) {
        self.fuelLevel  = fuelLevel
         super.init(imageNamed: "rocket fase")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changePieces()
    {
        
    }
    
    func startMoment()
    {
        self.fuelLevel = 100
        self.position = CGPoint(x: 50, y: 150)
        self.zPosition = 10
        self.physicsBody?.affectedByGravity = true
        self.physicsBody?.isDynamic = true
        self.physicsBody?.usesPreciseCollisionDetection = true
        self.physicsBody = SKPhysicsBody(texture: self.texture!,
                                              size: CGSize(width: self.size.width, height: self.size.height))
    }
    
    func spaceshipMovement()
    {
        let spaceshipMove = SKAction.applyImpulse(CGVector(dx: 0, dy: 5), duration: 0.1)
        self.run(spaceshipMove)
    }
    
   
}



