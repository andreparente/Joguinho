//
//  Gem.swift
//  Joguinho
//
//  Created by Felipe Viberti on 18/02/17.
//  Copyright © 2017 Andre Machado Parente. All rights reserved.
//

import Foundation

class Gem:Component {
    
    var originPlanet:PlanetName!
    
    init(originPlanet:PlanetName!) {
        self.originPlanet = originPlanet
        
        switch originPlanet.rawValue {
            case "Neptune":
            super.init(imageNamed: "neptuneGem")
            case "Uranus":
            super.init(imageNamed: "uranusGem")
            default:
            super.init(imageNamed: "")
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
