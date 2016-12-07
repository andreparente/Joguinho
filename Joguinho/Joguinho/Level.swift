//
//  Level.swift
//  Joguinho
//
//  Created by Felipe Viberti on 11/11/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import Foundation
import SpriteKit

class Level
{
    var rocks:[CGPoint]!
    var gems:[CGPoint]!
    var fueldrops:[CGPoint]!
    var oxygendrops:[CGPoint]!
    var planet:Planet!
    var id: Int!
    
    init(id:Int!,planet:Planet) {

        self.id = id
        self.planet = planet
        self.rocks = []
        self.gems = []
        
        if planet.type.rawValue == "Gaseous" {
            self.fueldrops = []
        }
        else {
            self.oxygendrops = []
        }
        switch planet.name.rawValue {
            case "Neptune":
            createLevelNeptune()
            case "Uranus":
            createLevelUranus()
            case "Saturn":
            createLevelSaturn()
            case "Jupiter":
            createLevelJupiter()
            case "Mars":
            createLevelMars()
            case "Earth":
            createLevelEarth()
            case "Venus":
            createLevelVenus()
            case "Mercury":
            createLevelMercury()
           default:
            break
        }
    }
    
  
    func createLevelNeptune() {
        switch self.id {
        case 1:
            self.rocks.append(CGPoint(x: 500, y: 55))
            self.rocks.append(CGPoint(x: 1000, y: 100))
            self.rocks.append(CGPoint(x: 1500, y: 75))
            self.rocks.append(CGPoint(x: 1700, y: 175))
            self.rocks.append(CGPoint(x: 2000, y: 205))
            self.rocks.append(CGPoint(x: 2200, y: 235))
            self.rocks.append(CGPoint(x: 2500, y: 150))
            self.rocks.append(CGPoint(x: 3200, y: 175))
            self.rocks.append(CGPoint(x: 3700, y: 240))
            self.rocks.append(CGPoint(x: 4000, y: 143))
            self.rocks.append(CGPoint(x: 4250, y: 175))
            self.rocks.append(CGPoint(x: 4400, y: 180))
            self.rocks.append(CGPoint(x: 4600, y: 240))
            self.gems.append(CGPoint(x: 600, y: 25))
            self.gems.append(CGPoint(x: 1200, y: 125))
            self.gems.append(CGPoint(x: 1750, y: 225))
            self.gems.append(CGPoint(x: 2200, y: 35))
            self.gems.append(CGPoint(x: 3000, y: 125))
            self.gems.append(CGPoint(x: 5000, y: 150))
            self.fueldrops.append(CGPoint(x: 550, y: 125))
            self.fueldrops.append(CGPoint(x: 1200, y: 235))
            self.fueldrops.append(CGPoint(x: 3850, y: 145))
        case 2:
            self.rocks.append(CGPoint(x: 300, y: 155))
            self.rocks.append(CGPoint(x: 800, y: 200))
            self.rocks.append(CGPoint(x: 1100, y: 45))
            self.rocks.append(CGPoint(x: 1400, y: 170))
            self.rocks.append(CGPoint(x: 1700, y: 220))
            self.rocks.append(CGPoint(x: 2000, y: 235))
            self.rocks.append(CGPoint(x: 2250, y: 135))
            self.rocks.append(CGPoint(x: 2500, y: 170))
            self.rocks.append(CGPoint(x: 3000, y: 275))
            self.rocks.append(CGPoint(x: 3400, y: 240))
            self.rocks.append(CGPoint(x: 3850, y: 129))
            self.rocks.append(CGPoint(x: 4250, y: 200))
            self.rocks.append(CGPoint(x: 4400, y: 190))
            self.rocks.append(CGPoint(x: 4800, y: 200))
            self.gems.append(CGPoint(x: 600, y: 125))
            self.gems.append(CGPoint(x: 1300, y: 79))
            self.gems.append(CGPoint(x: 1650, y: 210))
            self.gems.append(CGPoint(x: 2000, y: 70))
            self.gems.append(CGPoint(x: 3000, y: 225))
            self.gems.append(CGPoint(x: 6000, y: 150))
            self.fueldrops.append(CGPoint(x: 950, y: 215))
            self.fueldrops.append(CGPoint(x: 1600, y: 110))
            self.fueldrops.append(CGPoint(x: 2750, y: 145))
            self.fueldrops.append(CGPoint(x: 4100, y: 175))
            
        case 3:
            self.rocks.append(CGPoint(x: screenSize.width/2, y: 2*screenSize.height/8))
            self.rocks.append(CGPoint(x: 1.3*screenSize.width/3, y: 4*screenSize.height/8))
            self.rocks.append(CGPoint(x: screenSize.width, y: 3*screenSize.height/8))
            self.rocks.append(CGPoint(x: 1.4*screenSize.width, y: 6.3*screenSize.height/8))
            self.rocks.append(CGPoint(x: 2*screenSize.width, y: screenSize.height/8))
            self.rocks.append(CGPoint(x: 2.2*screenSize.width, y: 6.1*screenSize.height/8))
            self.rocks.append(CGPoint(x: 2.9*screenSize.width, y: 2*screenSize.height/8))
            self.rocks.append(CGPoint(x: 3.8*screenSize.width, y: 6*screenSize.height/8))
            self.rocks.append(CGPoint(x: 4.5*screenSize.width, y: 2*screenSize.height/8))
            self.rocks.append(CGPoint(x: 5*screenSize.width, y: 5.5*screenSize.height/8))
            self.rocks.append(CGPoint(x: 5.1*screenSize.width, y: 2.4*screenSize.height/8))
            self.rocks.append(CGPoint(x: 6*screenSize.width, y: 6*screenSize.height/8))
            self.rocks.append(CGPoint(x: 6.4*screenSize.width, y: 2.5*screenSize.height/8))
            self.rocks.append(CGPoint(x: 7*screenSize.width, y: screenSize.height/8))
            self.rocks.append(CGPoint(x: 8*screenSize.width, y: 5*screenSize.height/8))
            self.rocks.append(CGPoint(x: 9*screenSize.width, y: 3.5*screenSize.height/8))
            self.gems.append(CGPoint(x: screenSize.width/2, y: 3.5*screenSize.height/8))
            self.gems.append(CGPoint(x: screenSize.width, y: 2*screenSize.height/8))
            self.gems.append(CGPoint(x: 2*screenSize.width, y: 4*screenSize.height/8))
            self.gems.append(CGPoint(x: 4*screenSize.width, y: 4.5*screenSize.height/8))
            self.gems.append(CGPoint(x: 6*screenSize.width, y: 2.5*screenSize.height/8))
            self.gems.append(CGPoint(x: 9*screenSize.width, y: 150))
            self.fueldrops.append(CGPoint(x: 1.5*screenSize.width/2, y: 2*screenSize.height/8))
            self.fueldrops.append(CGPoint(x: 2.5*screenSize.width, y: 4*screenSize.height/8))
            self.fueldrops.append(CGPoint(x: 4.5*screenSize.width, y: 5*screenSize.height/8))
            self.fueldrops.append(CGPoint(x: 7.8*screenSize.width, y: 3.7*screenSize.height/8))
        case 4:
            self.rocks.append(CGPoint(x: screenSize.width/3, y: 3*screenSize.height/8))
            self.rocks.append(CGPoint(x: 2.8*screenSize.width/3, y: 6*screenSize.height/8))
            self.rocks.append(CGPoint(x: 1.1*screenSize.width, y: 4*screenSize.height/8))
            self.rocks.append(CGPoint(x: 2.2*screenSize.width, y: 5.1*screenSize.height/8))
            self.rocks.append(CGPoint(x: 2.9*screenSize.width, y: 2*screenSize.height/8))
            self.rocks.append(CGPoint(x: 3.5*screenSize.width, y: 3.3*screenSize.height/8))
            self.rocks.append(CGPoint(x: 3.9*screenSize.width, y: 4.1*screenSize.height/8))
            self.rocks.append(CGPoint(x: 4.8*screenSize.width, y: 2.5*screenSize.height/8))
            self.rocks.append(CGPoint(x: 5.5*screenSize.width, y: 6*screenSize.height/8))
            self.rocks.append(CGPoint(x: 6.2*screenSize.width, y: 2.5*screenSize.height/8))
            self.rocks.append(CGPoint(x: 6.8*screenSize.width, y: 3*screenSize.height/8))
            self.rocks.append(CGPoint(x: 7.5*screenSize.width, y: 4.5*screenSize.height/8))
            self.rocks.append(CGPoint(x: 8.2*screenSize.width, y: 7.5*screenSize.height/8))
            self.rocks.append(CGPoint(x: 8.8*screenSize.width, y: screenSize.height/8))
            self.rocks.append(CGPoint(x: 9.5*screenSize.width, y: 4*screenSize.height/8))
            self.rocks.append(CGPoint(x: 10.5*screenSize.width, y: 3.5*screenSize.height/8))
            self.gems.append(CGPoint(x: 2*screenSize.width/3, y: 4.2*screenSize.height/8))
            self.gems.append(CGPoint(x: screenSize.width/2, y: 6.5*screenSize.height/8))
            self.gems.append(CGPoint(x: 4*screenSize.width, y: 7*screenSize.height/8))
            self.gems.append(CGPoint(x: 5*screenSize.width, y: 5.4*screenSize.height/8))
            self.gems.append(CGPoint(x: 8*screenSize.width, y: 4.5*screenSize.height/8))
            self.gems.append(CGPoint(x: 12*screenSize.width, y: 150))
            self.fueldrops.append(CGPoint(x: 1.9*screenSize.width/2, y: 1.5*screenSize.height/8))
            self.fueldrops.append(CGPoint(x: 4.3*screenSize.width, y: 7*screenSize.height/8))
            self.fueldrops.append(CGPoint(x: 5.9*screenSize.width, y: 4*screenSize.height/8))
            self.fueldrops.append(CGPoint(x: 8.5*screenSize.width, y: 2.5*screenSize.height/8))
        default:
            break
        }
    }
    
    func createLevelUranus() {
        
    }
    
    func createLevelSaturn() {
        
    }
    
    func createLevelJupiter() {
        
    }
    
    func createLevelMars() {
        
    }
    
    func createLevelEarth() {
        
    }
    
    func createLevelVenus() {
        
    }
    
    func createLevelMercury() {
        
    }
    
}
