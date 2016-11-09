//
//  Astronaut.swift
//  Joguinho
//
//  Created by Andre Machado Parente on 10/21/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import Foundation
import SpriteKit

class Astronaut: SKSpriteNode {
    
    var oxygenLevel:Double!
    var imageNamed:String?
    
    init(oxygenLevel:Double,imageNamed:String) {
        self.oxygenLevel = oxygenLevel
        self.imageNamed = imageNamed
    }
    
    init()
    {
        super.init(texture: SKTexture(imageNamed: imageNamed!))
    }
 
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changeClothes()
    {
        
    }
}
