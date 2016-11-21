//
//  FuelBar.swift
//  Joguinho
//
//  Created by Andre Machado Parente on 16/11/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import Foundation
import UIKit

class FuelBar: Component {
    
    var spaceship:Spaceship!
    var pivo = screenSize.width/4 - 10

    
    func change(increase newValue: Int!) {

        spaceship.fuelLevel = spaceship.fuelLevel + newValue
        self.size.width = CGFloat(spaceship.fuelLevel)
        self.position = CGPoint(x: pivo + CGFloat(spaceship.fuelLevel/2), y: 7*screenSize.height/8)

    }
    
    init(image: String?, spaceship: Spaceship) {
        
        super.init(imageNamed: image)
        print(spaceship.fuelLevel)
        self.spaceship = spaceship
        //spaceship.fuelLevel = Int(screenSize.width/2)
        self.size.width = CGFloat(spaceship.fuelLevel)
        self.position = CGPoint(x: pivo + CGFloat(spaceship.fuelLevel/2), y: 7*screenSize.height/8)
        
       
    }
    
    func finish() {
        spaceship.fuelLevel = 0
        self.size.width = CGFloat(spaceship.fuelLevel)
        self.position = CGPoint(x: pivo + CGFloat(spaceship.fuelLevel/2), y: 7*screenSize.height/8)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
