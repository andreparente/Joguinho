//
//  Level.swift
//  Joguinho
//
//  Created by Andre Machado Parente on 10/21/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import Foundation
import SpriteKit

class Level:SKScene {
    
    var id: Int!
    var coinsAmount: Double!
    
    init(id:Int,coinsAmount:Double) {
        super.init()
        self.id = id
        self.coinsAmount = coinsAmount
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpBackground() {
        
    }
    
    func runLevel() {
        
    }
}

class TerrestrialLevel: Level
{
    var oxygenLevel:Int!
}

class GaseousLevel: Level
{
    var fuelLevel:Int!
}
