//
//  Level.swift
//  Joguinho
//
//  Created by Andre Machado Parente on 10/21/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import Foundation
import SpriteKit

class Level:SKNode {
    
    var coinsAmount: Double!
    var image:NSData!
}

class TerrestrialLevel:Level
{
    var oxygenLevel:Int!
}

class GaseousLevel:Level
{
    var fuelLevel:Int!
}
