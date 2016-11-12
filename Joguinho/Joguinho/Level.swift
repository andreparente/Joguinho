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
    
    init(id:Int!,planet:Planet)
    {

        self.id = id
        self.planet = planet
        self.rocks = []
        self.gems = []
        
        if planet.type.rawValue == "Gaseous"
        {
            self.fueldrops = []
        }
        else
        {
            self.oxygendrops = []
        }
        switch planet.name.rawValue
        {
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
    
  
    func createLevelNeptune()
    {
        switch self.id {
        case 1:
            self.rocks.append(CGPoint(x: 500, y: 55))
            self.rocks.append(CGPoint(x: 1000, y: 100))
            self.rocks.append(CGPoint(x: 1500, y: 75))
            self.rocks.append(CGPoint(x: 2000, y: 200))
            self.rocks.append(CGPoint(x: 1700, y: 175))
            self.rocks.append(CGPoint(x: 2200, y: 235))
            self.rocks.append(CGPoint(x: 2200, y: 235))
            self.rocks.append(CGPoint(x: 2500, y: 150))
            self.rocks.append(CGPoint(x: 3200, y: 175))
            self.rocks.append(CGPoint(x: 3700, y: 240))
            self.rocks.append(CGPoint(x: 4000, y: 143))
            self.rocks.append(CGPoint(x: 4250, y: 175))
            self.rocks.append(CGPoint(x: 4400, y: 180))
            self.rocks.append(CGPoint(x: 4800, y: 240))
            self.gems.append(CGPoint(x: 600, y: 25))
            self.gems.append(CGPoint(x: 1200, y: 125))
            self.gems.append(CGPoint(x: 1750, y: 225))
            self.gems.append(CGPoint(x: 2200, y: 35))
            self.gems.append(CGPoint(x: 3000, y: 125))
            self.fueldrops.append(CGPoint(x: 550, y: 35))
            self.fueldrops.append(CGPoint(x: 1200, y: 235))
            self.fueldrops.append(CGPoint(x: 2550, y: 145))
    
        default:
            break
        }
    }
    
    func createLevelUranus()
    {
        
    }
    
    func createLevelSaturn()
    {
        
    }
    
    func createLevelJupiter()
    {
        
    }
    
    func createLevelMars()
    {
        
    }
    
    func createLevelEarth()
    {
        
    }
    
    func createLevelVenus()
    {
        
    }
    
    func createLevelMercury()
    {
        
    }
    
}
