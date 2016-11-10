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
}



