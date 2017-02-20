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

