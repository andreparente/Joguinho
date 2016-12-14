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
    
    var spaceship: Spaceship!
    var pivo = (screenSize.width/667) * (screenSize.width/4 - 10)

    
    func change(increase newValue: Double!) {

        spaceship.fuelLevel = spaceship.fuelLevel + newValue
        self.size.width = CGFloat(spaceship.fuelLevel)
        self.position = CGPoint(x: pivo + CGFloat(spaceship.fuelLevel/2), y: 7*screenSize.height/8)
//       self.position = CGPoint(x: 80 + CGFloat(spaceship.fuelLevel/2) * size.width / 667, y: 5150 * size.height / 375)
    }
    
    init(image: String?, spaceship: Spaceship) {
        
        super.init(imageNamed: image)
        self.spaceship = spaceship
        self.size.width = CGFloat(spaceship.fuelLevel)
        self.position = CGPoint(x: (pivo + CGFloat(spaceship.fuelLevel/2)), y: 7*screenSize.height/8)
//       self.position = CGPoint(x: 80 + CGFloat(spaceship.fuelLevel/2) * size.width / 667, y: 5150 * size.height / 375)
        print(pivo + CGFloat(spaceship.fuelLevel/2))
        
       
    }
    
    func finish() {
        spaceship.fuelLevel = 0
        self.size.width = CGFloat(spaceship.fuelLevel)
        self.position = CGPoint(x: (pivo + CGFloat(spaceship.fuelLevel/2)), y: 7*screenSize.height/8)
//        self.position = CGPoint(x: 80 + CGFloat(spaceship.fuelLevel/2) * size.width / 667, y: 5150 * size.height / 375)
        print(pivo + CGFloat(spaceship.fuelLevel/2))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
