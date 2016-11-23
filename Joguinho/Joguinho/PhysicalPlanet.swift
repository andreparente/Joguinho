//
//  PhysicalPlanet.swift
//  Joguinho
//
//  Created by Lucas Ferraço on 08/11/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import Foundation

class PhysicalPlanet: Component {
    
    var planetSize: Double!
    
    init(planetSize:Double,planetName:PlanetName) {
        self.planetSize = planetSize
        super.init(imageNamed: planetName.rawValue)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

enum PlanetName:String {
    case Sun  = "Sun"
    case Mercury = "Mercury"
    case Venus = "Venus"
    case Earth = "Earth"
    case Mars = "Mars"
    case Jupiter = "Jupiter"
    case Saturn = "Saturn"
    case Uranus = "Uranus"
    case Neptune = "Neptune"
}

enum PlanetIndex:Int {
    case Mercury = 7
    case Venus = 6
    case Earth = 5
    case Mars = 4
    case Jupiter = 3
    case Saturn = 2
    case Uranus = 1
    case Neptune = 0
}
