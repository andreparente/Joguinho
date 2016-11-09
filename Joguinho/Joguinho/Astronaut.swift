//
//  Astronaut.swift
//  Joguinho
//
//  Created by Andre Machado Parente on 10/21/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import Foundation
import SpriteKit

class Astronaut: Component {
    
    var oxygenLevel:Double!
    
    
    init(oxygenLevel:Double) {
        self.oxygenLevel = oxygenLevel
        super.init(imageNamed: "")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changeClothes()
    {
        
    }
}
