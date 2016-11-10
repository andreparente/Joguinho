//
//  Planet.swift
//  Joguinho
//
//  Created by Andre Machado Parente on 10/21/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import Foundation


class Planet {
    
    var name: PlanetName!
    var gravity: Double!
    var type: PlanetType!
    var levels: [Level]!
    
    init(name:PlanetName,gravity:Double,type:PlanetType,levels:[Level])
    {
        self.name = name
        self.gravity = gravity
        self.type = type
        self.levels = levels
    }
    
}

enum PlanetType:String {
    
    case gaseous = "Gaseous"
    case terrestrial = "Terrestrial"
}

