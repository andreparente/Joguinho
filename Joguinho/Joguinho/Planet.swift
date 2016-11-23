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
    var description: String!
    var index:PlanetIndex!
    
    init(name:PlanetName,gravity:Double,type:PlanetType,index:PlanetIndex) {
        self.name = name
        self.gravity = gravity
        self.type = type
        self.index = index
    }
    
}

enum PlanetType:String {
    
    case gaseous = "Gaseous"
    case terrestrial = "Terrestrial"
}


