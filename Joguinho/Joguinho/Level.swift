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
    var planet:Planet!
    var id: Int!
    
    init(id:Int!,planet:Planet)
    {

        self.id = id
        self.planet = planet
        self.rocks = []
        self.gems = []
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
            self.rocks.append(CGPoint(x: 500, y: 10))
            self.rocks.append(CGPoint(x: 1000, y: 100))
            self.rocks.append(CGPoint(x: 1500, y: 50))
            self.rocks.append(CGPoint(x: 2000, y: 200))
            self.rocks.append(CGPoint(x: 1700, y: 175))
            self.rocks.append(CGPoint(x: 2200, y: 235))
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
