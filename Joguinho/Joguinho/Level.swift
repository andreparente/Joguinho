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

            self.rocks.append(CGPoint(x: screenSize.width / 1.136, y: screenSize.height / 5.81))
            self.rocks.append(CGPoint(x: 1.4*screenSize.width, y: screenSize.height/8))
            self.rocks.append(CGPoint(x: 1.5*screenSize.width, y: 8*screenSize.height/8))
            self.rocks.append(CGPoint(x: screenSize.width * 1.76, y: screenSize.height / 3.2))
            self.rocks.append(CGPoint(x: screenSize.width * 2.64, y: screenSize.height / 4.26))
            self.rocks.append(CGPoint(x: screenSize.width * 3, y: screenSize.height / 1.82))
            self.rocks.append(CGPoint(x: screenSize.width * 3.52, y: screenSize.height / 1.56))
            self.rocks.append(CGPoint(x: screenSize.width * 3.87, y: screenSize.height / 1.36))
            self.rocks.append(CGPoint(x: screenSize.width * 4.40, y: screenSize.height / 2.13))
            self.rocks.append(CGPoint(x: screenSize.width * 5.63, y: screenSize.height / 1.82))
            self.rocks.append(CGPoint(x: 5.7*screenSize.width, y: screenSize.height/8))
            self.rocks.append(CGPoint(x: 5.8*screenSize.width, y: 8*screenSize.height/8))
            self.rocks.append(CGPoint(x: screenSize.width * 6.51, y: screenSize.height / 1.33))
            self.rocks.append(CGPoint(x: screenSize.width * 7.04, y: screenSize.height / 2.23))
            self.rocks.append(CGPoint(x: screenSize.width * 7.48, y: screenSize.height / 1.82))
            self.rocks.append(CGPoint(x: screenSize.width * 7.74, y: screenSize.height / 1.77))
            self.rocks.append(CGPoint(x: screenSize.width * 8.09, y: screenSize.height / 1.33))
            self.gems.append(CGPoint(x: screenSize.width * 1.05, y: screenSize.height / 12.8))
            self.gems.append(CGPoint(x: screenSize.width * 2.11, y: screenSize.height / 2.56))
            self.gems.append(CGPoint(x: screenSize.width * 3.08, y: screenSize.height / 1.42))
            self.gems.append(CGPoint(x: screenSize.width * 3.87, y: screenSize.height / 9.14))
            self.gems.append(CGPoint(x: screenSize.width * 5.28, y: screenSize.height / 2.56))
            self.gems.append(CGPoint(x: screenSize.width * 8.80, y: screenSize.height/2))
            self.fueldrops.append(CGPoint(x: screenSize.width / 1.03, y: screenSize.height / 2.56))
            self.fueldrops.append(CGPoint(x: screenSize.width * 2.11, y: screenSize.height / 1.36))
            self.fueldrops.append(CGPoint(x: screenSize.width * 6.78, y: screenSize.height / 2.20))
        case 2:
            self.rocks.append(CGPoint(x: screenSize.width / 1.89, y: screenSize.height / 2.06))
            self.rocks.append(CGPoint(x: screenSize.width * 1.40, y: screenSize.height / 1.6))
            self.rocks.append(CGPoint(x: 1.4*screenSize.width, y: screenSize.height/8))
            self.rocks.append(CGPoint(x: 1.5*screenSize.width, y: 8*screenSize.height/8))
            self.rocks.append(CGPoint(x: screenSize.width * 1.93, y: screenSize.height / 7.1))
            self.rocks.append(CGPoint(x: screenSize.width * 2.46, y: screenSize.height / 1.88))
            self.rocks.append(CGPoint(x: screenSize.width * 2.99, y: screenSize.height / 1.45))
            self.rocks.append(CGPoint(x: screenSize.width * 3.52, y: screenSize.height / 1.36))
            self.rocks.append(CGPoint(x: screenSize.width * 3.96, y: screenSize.height / 2.37))
            self.rocks.append(CGPoint(x: screenSize.width * 4.40, y: screenSize.height / 1.88))
            self.rocks.append(CGPoint(x: 5*screenSize.width, y: screenSize.height/8))
            self.rocks.append(CGPoint(x: 5*screenSize.width, y: 8*screenSize.height/8))
            self.rocks.append(CGPoint(x: screenSize.width * 5.28, y: screenSize.height / 1.16))
            self.rocks.append(CGPoint(x: screenSize.width * 5.98, y: screenSize.height / 1.33))
            self.rocks.append(CGPoint(x: screenSize.width * 6.77, y: screenSize.height / 2.48))
            self.rocks.append(CGPoint(x: screenSize.width * 7.48, y: screenSize.height / 1.6))
            self.rocks.append(CGPoint(x: screenSize.width * 7.74, y: screenSize.height / 1.68))
            self.rocks.append(CGPoint(x: screenSize.width * 8.45, y: screenSize.height / 1.6))
            self.gems.append(CGPoint(x: screenSize.width * 1.05, y: screenSize.height / 2.56))
            self.gems.append(CGPoint(x: screenSize.width * 2.28, y: screenSize.height / 4.05))
            self.gems.append(CGPoint(x: screenSize.width * 2.90, y: screenSize.height / 1.52))
            self.gems.append(CGPoint(x: screenSize.width * 3.52, y: screenSize.height / 4.57))
            self.gems.append(CGPoint(x: screenSize.width * 5.28, y: screenSize.height / 1.42))
            self.gems.append(CGPoint(x: screenSize.width * 10.56, y: screenSize.height/2))
            self.fueldrops.append(CGPoint(x:screenSize.width * 1.67, y: screenSize.height / 1.48))
            self.fueldrops.append(CGPoint(x: screenSize.width * 2.81, y: screenSize.height / 2.90))
            self.fueldrops.append(CGPoint(x: screenSize.width * 4.84, y: screenSize.height / 2.20))
            self.fueldrops.append(CGPoint(x: screenSize.width * 7.21, y: screenSize.height / 1.82))
            
        case 3:
            self.rocks.append(CGPoint(x: screenSize.width/2, y: 2*screenSize.height/8))
            self.rocks.append(CGPoint(x: 1.3*screenSize.width/3, y: 4*screenSize.height/8))
            self.rocks.append(CGPoint(x: 1.4*screenSize.width, y: screenSize.height/8))
            self.rocks.append(CGPoint(x: 1.5*screenSize.width, y: 8*screenSize.height/8))
            self.rocks.append(CGPoint(x: screenSize.width, y: 3*screenSize.height/8))
            self.rocks.append(CGPoint(x: 1.4*screenSize.width, y: 6.3*screenSize.height/8))
            self.rocks.append(CGPoint(x: 2*screenSize.width, y: screenSize.height/8))
            self.rocks.append(CGPoint(x: 2.2*screenSize.width, y: 6.1*screenSize.height/8))
            self.rocks.append(CGPoint(x: 2.9*screenSize.width, y: 2*screenSize.height/8))
            self.rocks.append(CGPoint(x: 3*screenSize.width, y: screenSize.height/8))
            self.rocks.append(CGPoint(x: 3*screenSize.width, y: 8*screenSize.height/8))
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
            self.gems.append(CGPoint(x: 9*screenSize.width, y: screenSize.height/2))
            self.fueldrops.append(CGPoint(x: 1.5*screenSize.width/2, y: 2*screenSize.height/8))
            self.fueldrops.append(CGPoint(x: 2.5*screenSize.width, y: 4*screenSize.height/8))
            self.fueldrops.append(CGPoint(x: 4.5*screenSize.width, y: 5*screenSize.height/8))
            self.fueldrops.append(CGPoint(x: 7.8*screenSize.width, y: 3.7*screenSize.height/8))
        case 4:
            self.rocks.append(CGPoint(x: screenSize.width/3, y: 3*screenSize.height/8))
            self.rocks.append(CGPoint(x: 2.8*screenSize.width/3, y: 6*screenSize.height/8))
            self.rocks.append(CGPoint(x: 1.1*screenSize.width, y: 4*screenSize.height/8))
            self.rocks.append(CGPoint(x: 2.2*screenSize.width, y: 5.1*screenSize.height/8))
            self.rocks.append(CGPoint(x: 2.4*screenSize.width, y: screenSize.height/8))
            self.rocks.append(CGPoint(x: 2.6*screenSize.width, y: 8*screenSize.height/8))
            self.rocks.append(CGPoint(x: 2.9*screenSize.width, y: 2*screenSize.height/8))
            self.rocks.append(CGPoint(x: 3.5*screenSize.width, y: 3.3*screenSize.height/8))
            self.rocks.append(CGPoint(x: 3.9*screenSize.width, y: 4.1*screenSize.height/8))
            self.rocks.append(CGPoint(x: 4.8*screenSize.width, y: 2.5*screenSize.height/8))
            self.rocks.append(CGPoint(x: 5.5*screenSize.width, y: 6*screenSize.height/8))
            self.rocks.append(CGPoint(x: 6.2*screenSize.width, y: 2.5*screenSize.height/8))
            self.rocks.append(CGPoint(x: 6.8*screenSize.width, y: 3*screenSize.height/8))
            self.rocks.append(CGPoint(x: 6.9*screenSize.width, y: screenSize.height/8))
            self.rocks.append(CGPoint(x: 7.1*screenSize.width, y: 8*screenSize.height/8))
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
            self.gems.append(CGPoint(x: 12*screenSize.width, y: screenSize.height/2))
            self.fueldrops.append(CGPoint(x: 1.9*screenSize.width/2, y: 1.5*screenSize.height/8))
            self.fueldrops.append(CGPoint(x: 4.3*screenSize.width, y: 7*screenSize.height/8))
            self.fueldrops.append(CGPoint(x: 5.9*screenSize.width, y: 4*screenSize.height/8))
            self.fueldrops.append(CGPoint(x: 8.5*screenSize.width, y: 2.5*screenSize.height/8))
            
        case 5:
            self.rocks.append(CGPoint(x: screenSize.width/2, y: 2*screenSize.height/8))
            self.rocks.append(CGPoint(x: 1.3*screenSize.width/3, y: 5*screenSize.height/8))
            self.rocks.append(CGPoint(x: screenSize.width, y: 2*screenSize.height/8))
            self.rocks.append(CGPoint(x: 1.4*screenSize.width, y: 6*screenSize.height/8))
            self.rocks.append(CGPoint(x: 2*screenSize.width, y: 1.2*screenSize.height/8))
            self.rocks.append(CGPoint(x: 2.2*screenSize.width, y: 5.2*screenSize.height/8))
            self.rocks.append(CGPoint(x: 2.5*screenSize.width, y: screenSize.height/8))
            self.rocks.append(CGPoint(x: 2.8*screenSize.width, y: 8*screenSize.height/8))
            self.rocks.append(CGPoint(x: 2.9*screenSize.width, y: 2.3*screenSize.height/8))
            self.rocks.append(CGPoint(x: 3.8*screenSize.width, y: 4*screenSize.height/8))
            self.rocks.append(CGPoint(x: 4.5*screenSize.width, y: 1*screenSize.height/8))
            self.rocks.append(CGPoint(x: 5*screenSize.width, y: 5.3*screenSize.height/8))
            self.rocks.append(CGPoint(x: 5.1*screenSize.width, y: 2.1*screenSize.height/8))
            self.rocks.append(CGPoint(x: 6*screenSize.width, y: 5.4*screenSize.height/8))
            self.rocks.append(CGPoint(x: 6.4*screenSize.width, y: 4*screenSize.height/8))
            self.rocks.append(CGPoint(x: 7*screenSize.width, y: screenSize.height/8))
            self.rocks.append(CGPoint(x: 7.8*screenSize.width, y: 4.2*screenSize.height/8))
            self.rocks.append(CGPoint(x: 8.5*screenSize.width, y: 3.5*screenSize.height/8))
            self.rocks.append(CGPoint(x: 8.8*screenSize.width, y: 4*screenSize.height/8))
            self.rocks.append(CGPoint(x: 9.2*screenSize.width, y: screenSize.height/8))
            self.rocks.append(CGPoint(x: 8.9*screenSize.width, y: 8*screenSize.height/8))
            self.rocks.append(CGPoint(x: 9.5*screenSize.width, y: 5.2*screenSize.height/8))
            self.rocks.append(CGPoint(x: 10*screenSize.width, y: 3.5*screenSize.height/8))
            self.gems.append(CGPoint(x: screenSize.width/2, y: 3.5*screenSize.height/8))
            self.gems.append(CGPoint(x: screenSize.width, y: 2*screenSize.height/8))
            self.gems.append(CGPoint(x: 2*screenSize.width, y: 4*screenSize.height/8))
            self.gems.append(CGPoint(x: 4*screenSize.width, y: 4.5*screenSize.height/8))
            self.gems.append(CGPoint(x: 6*screenSize.width, y: 2.5*screenSize.height/8))
            self.gems.append(CGPoint(x: 9*screenSize.width, y: screenSize.height/2))
            self.gems.append(CGPoint(x: 9.5*screenSize.width, y: 3*screenSize.height/8))
            self.gems.append(CGPoint(x: 10.5*screenSize.width, y: screenSize.height/2))
            self.fueldrops.append(CGPoint(x: 1.5*screenSize.width/2, y: 2*screenSize.height/8))
            self.fueldrops.append(CGPoint(x: 2.5*screenSize.width, y: 4*screenSize.height/8))
            self.fueldrops.append(CGPoint(x: 4.5*screenSize.width, y: 5*screenSize.height/8))
            self.fueldrops.append(CGPoint(x: 7.8*screenSize.width, y: 3.7*screenSize.height/8))
            self.fueldrops.append(CGPoint(x: 8.5*screenSize.width, y: 2*screenSize.height/8))
        
        case 6:
            self.rocks.append(CGPoint(x: screenSize.width/3, y: 4.5021628309051*screenSize.height/8))
            self.rocks.append(CGPoint(x: 2*screenSize.width/3, y: 6.5407085025407*screenSize.height/8))
            self.rocks.append(CGPoint(x: 1.2*screenSize.width, y: 5.439059646539*screenSize.height/8))
            self.rocks.append(CGPoint(x: 1.5*screenSize.width, y: screenSize.height/8))
            self.rocks.append(CGPoint(x: 1.3*screenSize.width, y: 8*screenSize.height/8))
            self.rocks.append(CGPoint(x: 1.5*screenSize.width, y: 3.439087069565*screenSize.height/8))
            self.rocks.append(CGPoint(x: 2.9*screenSize.width, y: 5.2008133398838*screenSize.height/8))
            self.rocks.append(CGPoint(x: 3.7*screenSize.width, y: 3.5170069811945*screenSize.height/8))
            self.rocks.append(CGPoint(x: 3.9*screenSize.width, y: 4.8588079008548*screenSize.height/8))
            self.rocks.append(CGPoint(x: 4.5*screenSize.width, y: 1.5979463938148*screenSize.height/8))
            self.rocks.append(CGPoint(x: 5.3*screenSize.width, y: 4*screenSize.height/8))
            self.rocks.append(CGPoint(x: 6.1*screenSize.width, y: 5.6634849350264*screenSize.height/8))
            self.rocks.append(CGPoint(x: 6.5*screenSize.width, y: 6.1451229935722*screenSize.height/8))
            self.rocks.append(CGPoint(x: 6.99*screenSize.width, y: screenSize.height/8))
            self.rocks.append(CGPoint(x: 6.7*screenSize.width, y: 8*screenSize.height/8))
            self.rocks.append(CGPoint(x: 7.3*screenSize.width, y: 6.4338300546789*screenSize.height/8))
            self.rocks.append(CGPoint(x: 8*screenSize.width, y: 5.3121076111272*screenSize.height/8))
            self.rocks.append(CGPoint(x: 8.5*screenSize.width, y: screenSize.height/8))
            self.rocks.append(CGPoint(x: 9*screenSize.width, y: 4*screenSize.height/8))
            self.rocks.append(CGPoint(x: 9.6*screenSize.width, y: 3.5*screenSize.height/8))
            self.gems.append(CGPoint(x: 2*screenSize.width/3, y: 4.2*screenSize.height/8))
            self.gems.append(CGPoint(x: screenSize.width/2, y: 6.5*screenSize.height/8))
            self.gems.append(CGPoint(x: 4*screenSize.width, y: 7*screenSize.height/8))
            self.gems.append(CGPoint(x: 5*screenSize.width, y: 5.4*screenSize.height/8))
            self.gems.append(CGPoint(x: 8*screenSize.width, y: 4.5*screenSize.height/8))
            self.gems.append(CGPoint(x: 11*screenSize.width, y: screenSize.height/2))
            self.fueldrops.append(CGPoint(x: 1.9*screenSize.width/2, y: 1.5*screenSize.height/8))
            self.fueldrops.append(CGPoint(x: 4.3*screenSize.width, y: 7*screenSize.height/8))
            self.fueldrops.append(CGPoint(x: 5.9*screenSize.width, y: 4*screenSize.height/8))
            self.fueldrops.append(CGPoint(x: 8.5*screenSize.width, y: 2.5*screenSize.height/8))
        case 7:
            self.rocks.append(CGPoint(x: screenSize.width/2, y: 4.5319858722072*screenSize.height/8))
            self.rocks.append(CGPoint(x: screenSize.width, y: 3.2586223135044*screenSize.height/8))
            self.rocks.append(CGPoint(x: 1.2*screenSize.width, y: screenSize.height/8))
            self.rocks.append(CGPoint(x: 1.2*screenSize.width, y: 8*screenSize.height/8))
            self.rocks.append(CGPoint(x: 1.2*screenSize.width, y: 4.7048951402329*screenSize.height/8))
            self.rocks.append(CGPoint(x: 1.7*screenSize.width, y: 6.0496356562011*screenSize.height/8))
            self.rocks.append(CGPoint(x: 2.8*screenSize.width, y: 1.8816220352341*screenSize.height/8))
            self.rocks.append(CGPoint(x: 3.5*screenSize.width, y: 7.2728452204135*screenSize.height/8))
            self.rocks.append(CGPoint(x: 3.9*screenSize.width, y: 4*screenSize.height/8))
            self.rocks.append(CGPoint(x: 4.5*screenSize.width, y: 3.6069747489444*screenSize.height/8))
            self.rocks.append(CGPoint(x: 5.3*screenSize.width, y: 3.690021257936*screenSize.height/8))
            self.rocks.append(CGPoint(x: 6*screenSize.width, y: 4.1144758249235*screenSize.height/8))
            self.rocks.append(CGPoint(x: 6.5*screenSize.width, y: 6.1451229935722*screenSize.height/8))
            self.rocks.append(CGPoint(x: 7.3*screenSize.width, y: 4.8350349724456*screenSize.height/8))
            self.rocks.append(CGPoint(x: 7.6*screenSize.width, y: screenSize.height/8))
            self.rocks.append(CGPoint(x: 7.8*screenSize.width, y: 8*screenSize.height/8))
            self.rocks.append(CGPoint(x: 8*screenSize.width, y: 5.3121076111272*screenSize.height/8))
            self.rocks.append(CGPoint(x: 8.5*screenSize.width, y: screenSize.height/8))
            self.rocks.append(CGPoint(x: 9*screenSize.width, y: 4*screenSize.height/8))
            self.rocks.append(CGPoint(x: 10*screenSize.width, y: 3.5*screenSize.height/8))
            self.gems.append(CGPoint(x: screenSize.width, y: 4.2*screenSize.height/8))
            self.gems.append(CGPoint(x: screenSize.width/2, y: 6.5*screenSize.height/8))
            self.gems.append(CGPoint(x: 2*screenSize.width, y: 7*screenSize.height/8))
            self.gems.append(CGPoint(x: 3.5*screenSize.width, y: 5.4*screenSize.height/8))
            self.gems.append(CGPoint(x: 5*screenSize.width, y: 4.5*screenSize.height/8))
            self.gems.append(CGPoint(x: 7*screenSize.width, y: 4*screenSize.height/8))
            self.gems.append(CGPoint(x: 9*screenSize.width, y: 1*screenSize.height/8))
            self.gems.append(CGPoint(x: 11*screenSize.width, y: screenSize.height/2))
            self.fueldrops.append(CGPoint(x: 1.9*screenSize.width/2, y: 1.5*screenSize.height/8))
            self.fueldrops.append(CGPoint(x: 4.3*screenSize.width, y: 7*screenSize.height/8))
            self.fueldrops.append(CGPoint(x: 5.9*screenSize.width, y: 4*screenSize.height/8))
            self.fueldrops.append(CGPoint(x: 8.5*screenSize.width, y: 2.5*screenSize.height/8))
        case 8:
            self.rocks.append(CGPoint(x: screenSize.width/2, y: 5.6521584428624*screenSize.height/8))
            self.rocks.append(CGPoint(x: screenSize.width, y: 3*screenSize.height/8))
            self.rocks.append(CGPoint(x: 1.2*screenSize.width, y: 4.0617284734555*screenSize.height/8))
            self.rocks.append(CGPoint(x: 1.7*screenSize.width, y: 5.9958217091373*screenSize.height/8))
            self.rocks.append(CGPoint(x: 2.8*screenSize.width, y: 2.3518726326767*screenSize.height/8))
            self.rocks.append(CGPoint(x: 3*screenSize.width, y: screenSize.height/8))
            self.rocks.append(CGPoint(x: 3*screenSize.width, y: 8*screenSize.height/8))
            self.rocks.append(CGPoint(x: 3.5*screenSize.width, y: 5.8968159397118*screenSize.height/8))
            self.rocks.append(CGPoint(x: 3.9*screenSize.width, y: 3.5116462134345*screenSize.height/8))
            self.rocks.append(CGPoint(x: 4.5*screenSize.width, y: 2*screenSize.height/8))
            self.rocks.append(CGPoint(x: 5.3*screenSize.width, y: 4.5*screenSize.height/8))
            self.rocks.append(CGPoint(x: 6*screenSize.width, y: 2.8393086044767*screenSize.height/8))
            self.rocks.append(CGPoint(x: 6.5*screenSize.width, y: 6.1451229935722*screenSize.height/8))
            self.rocks.append(CGPoint(x: 7.3*screenSize.width, y: 4.8350349724456*screenSize.height/8))
            self.rocks.append(CGPoint(x: 8*screenSize.width, y: 5.3121076111272*screenSize.height/8))
            self.rocks.append(CGPoint(x: 8.1*screenSize.width, y: 4*screenSize.height/8))
            self.rocks.append(CGPoint(x: 8.7*screenSize.width, y: 6.2556834141517*screenSize.height/8))
            self.rocks.append(CGPoint(x: 9.5*screenSize.width, y: 3.690021257936*screenSize.height/8))
            self.rocks.append(CGPoint(x: 10*screenSize.width, y: 4.1144758249235*screenSize.height/8))
            self.rocks.append(CGPoint(x: 10.3*screenSize.width, y: 2.05374899388*screenSize.height/8))
            self.rocks.append(CGPoint(x: 10.9*screenSize.width, y: 4.8350349724456*screenSize.height/8))
            self.rocks.append(CGPoint(x: 11.5*screenSize.width, y: 5.3121076111272*screenSize.height/8))
            self.rocks.append(CGPoint(x: 12*screenSize.width, y: screenSize.height/8))
            self.rocks.append(CGPoint(x: 12.3*screenSize.width, y: 4*screenSize.height/8))
            self.rocks.append(CGPoint(x: 13*screenSize.width, y: 3.5*screenSize.height/8))
            self.rocks.append(CGPoint(x: 14*screenSize.width, y: screenSize.height/8))
            self.rocks.append(CGPoint(x: 14*screenSize.width, y: 2*screenSize.height/8))
            self.rocks.append(CGPoint(x: 14.2*screenSize.width, y: screenSize.height/8))
            self.rocks.append(CGPoint(x: 14.2*screenSize.width, y: 8*screenSize.height/8))
            self.rocks.append(CGPoint(x: 14*screenSize.width, y: 4*screenSize.height/8))
            self.rocks.append(CGPoint(x: 14*screenSize.width, y: 6*screenSize.height/8))
            self.gems.append(CGPoint(x: screenSize.width, y: 4.2*screenSize.height/8))
            self.gems.append(CGPoint(x: screenSize.width/2, y: 6.5*screenSize.height/8))
            self.gems.append(CGPoint(x: 2*screenSize.width, y: 7*screenSize.height/8))
            self.gems.append(CGPoint(x: 3.5*screenSize.width, y: 5.4*screenSize.height/8))
            self.gems.append(CGPoint(x: 5*screenSize.width, y: 4.5*screenSize.height/8))
            self.gems.append(CGPoint(x: 7*screenSize.width, y: 4*screenSize.height/8))
            self.gems.append(CGPoint(x: 9*screenSize.width, y: 6.0651286249352*screenSize.height/8))
            self.gems.append(CGPoint(x: 10*screenSize.width, y: 6.0140587987444*screenSize.height/8))
            self.gems.append(CGPoint(x: 11*screenSize.width, y: 1*screenSize.height/8))
            self.gems.append(CGPoint(x: 15*screenSize.width, y: 4.9990810298822*screenSize.height/8))
            self.fueldrops.append(CGPoint(x: 1.5*screenSize.width, y: 2*screenSize.height/8))
            self.fueldrops.append(CGPoint(x: 2.3*screenSize.width, y: 4.6*screenSize.height/8))
            self.fueldrops.append(CGPoint(x: 3*screenSize.width, y: 6.4*screenSize.height/8))
            self.fueldrops.append(CGPoint(x: 5*screenSize.width, y: 4*screenSize.height/8))
            self.fueldrops.append(CGPoint(x: 7*screenSize.width, y: 3*screenSize.height/8))
            self.fueldrops.append(CGPoint(x: 8.5*screenSize.width, y: 4.7*screenSize.height/8))
            self.fueldrops.append(CGPoint(x: 10*screenSize.width, y: 5*screenSize.height/8))
            self.fueldrops.append(CGPoint(x: 11*screenSize.width, y: 4*screenSize.height/8))
        default:
            break
        }
    }
    
    func createLevelUranus() {
        //Colocar aqui as posições dos levels em Urano
        switch self.id {
        case 1:
            self.rocks.append(CGPoint(x: 1.2*screenSize.width/2, y: 6.5554494515785*screenSize.height/8))
            self.rocks.append(CGPoint(x: 1.5*screenSize.width/2, y: 5.8331689973516*screenSize.height/8))
            self.rocks.append(CGPoint(x: 1.2*screenSize.width, y: screenSize.height/8))
            self.rocks.append(CGPoint(x: 1.3*screenSize.width, y: 7.8*screenSize.height/8))
            self.rocks.append(CGPoint(x: 1.4*screenSize.width, y: 5.9808486206368*screenSize.height/8))
            self.rocks.append(CGPoint(x: 1.7*screenSize.width, y: 6.0556826209909*screenSize.height/8))
            self.rocks.append(CGPoint(x: 2.5*screenSize.width, y: 4.0886113625432*screenSize.height/8))
            self.rocks.append(CGPoint(x: 3.0*screenSize.width, y: 5.2726118253882*screenSize.height/8))
            self.rocks.append(CGPoint(x: 3.7*screenSize.width, y: 2.6060246353066*screenSize.height/8))
            self.rocks.append(CGPoint(x: 4.2*screenSize.width, y: 4.1419960726714*screenSize.height/8))
            self.rocks.append(CGPoint(x: 5.0*screenSize.width, y: 1.6677675739246*screenSize.height/8))
            self.rocks.append(CGPoint(x: 5.7*screenSize.width, y: 2.6424171080079*screenSize.height/8))
            self.rocks.append(CGPoint(x: 6.5*screenSize.width, y: 7.1984189521514*screenSize.height/8))
            self.rocks.append(CGPoint(x: 7.2*screenSize.width, y: 4.27673700651*screenSize.height/8))
            self.rocks.append(CGPoint(x: 7.6*screenSize.width, y: screenSize.height/8))
            self.rocks.append(CGPoint(x: 7.8*screenSize.width, y: 8*screenSize.height/8))
            self.rocks.append(CGPoint(x: 8.3*screenSize.width, y: 2.6355860953385*screenSize.height/8))
            self.rocks.append(CGPoint(x: 8.7*screenSize.width, y: 2.9952844246269*screenSize.height/8))
            self.rocks.append(CGPoint(x: 9.5*screenSize.width, y: 4*screenSize.height/8))
            self.rocks.append(CGPoint(x: 10*screenSize.width, y: 3.5*screenSize.height/8))
            self.gems.append(CGPoint(x: screenSize.width, y: screenSize.height/2))
            self.gems.append(CGPoint(x: screenSize.width/2, y: 1*screenSize.height/8))
            self.gems.append(CGPoint(x: 2*screenSize.width, y: 4*screenSize.height/8))
            self.gems.append(CGPoint(x: 3.5*screenSize.width, y: 5.4*screenSize.height/8))
            self.gems.append(CGPoint(x: 5*screenSize.width, y: 4.5*screenSize.height/8))
            self.gems.append(CGPoint(x: 7*screenSize.width, y: 7*screenSize.height/8))
            self.gems.append(CGPoint(x: 9*screenSize.width, y: 6.5*screenSize.height/8))
            self.gems.append(CGPoint(x: 11*screenSize.width, y: 4.2*screenSize.height/8))
            self.fueldrops.append(CGPoint(x: 1.1*screenSize.width, y: 7*screenSize.height/8))
            self.fueldrops.append(CGPoint(x: 3.5*screenSize.width, y: 1.5*screenSize.height/8))
            self.fueldrops.append(CGPoint(x: 5.9*screenSize.width, y: 2*screenSize.height/8))
            self.fueldrops.append(CGPoint(x: 8.5*screenSize.width, y: 4*screenSize.height/8))
        case 2:
            self.rocks.append(CGPoint(x: 1.2*screenSize.width/2, y: 6.5554494515785*screenSize.height/8))
            self.rocks.append(CGPoint(x: 1.5*screenSize.width/2, y: 5.8331689973516*screenSize.height/8))
            self.rocks.append(CGPoint(x: 1.2*screenSize.width, y: screenSize.height/8))
            self.rocks.append(CGPoint(x: 1.3*screenSize.width, y: 7.8*screenSize.height/8))
            self.rocks.append(CGPoint(x: 1.4*screenSize.width, y: 5.9808486206368*screenSize.height/8))
            self.rocks.append(CGPoint(x: 1.7*screenSize.width, y: 6.0556826209909*screenSize.height/8))
            self.rocks.append(CGPoint(x: 2.5*screenSize.width, y: 4.0886113625432*screenSize.height/8))
            self.rocks.append(CGPoint(x: 3.0*screenSize.width, y: 5.2726118253882*screenSize.height/8))
            self.rocks.append(CGPoint(x: 3.7*screenSize.width, y: 2.6060246353066*screenSize.height/8))
            self.rocks.append(CGPoint(x: 4.2*screenSize.width, y: 4.1419960726714*screenSize.height/8))
            self.rocks.append(CGPoint(x: 5.0*screenSize.width, y: 1.6677675739246*screenSize.height/8))
            self.rocks.append(CGPoint(x: 5.7*screenSize.width, y: 2.6424171080079*screenSize.height/8))
            self.rocks.append(CGPoint(x: 6.5*screenSize.width, y: 7.1984189521514*screenSize.height/8))
            self.rocks.append(CGPoint(x: 7.2*screenSize.width, y: 4.27673700651*screenSize.height/8))
            self.rocks.append(CGPoint(x: 7.6*screenSize.width, y: screenSize.height/8))
            self.rocks.append(CGPoint(x: 7.8*screenSize.width, y: 8*screenSize.height/8))
            self.rocks.append(CGPoint(x: 8.3*screenSize.width, y: 2.6355860953385*screenSize.height/8))
            self.rocks.append(CGPoint(x: 8.7*screenSize.width, y: 2.9952844246269*screenSize.height/8))
            self.rocks.append(CGPoint(x: 9.5*screenSize.width, y: 4*screenSize.height/8))
            self.rocks.append(CGPoint(x: 10*screenSize.width, y: 3.5*screenSize.height/8))
            self.gems.append(CGPoint(x: screenSize.width, y: screenSize.height/2))
            self.gems.append(CGPoint(x: screenSize.width/2, y: 1*screenSize.height/8))
            self.gems.append(CGPoint(x: 2*screenSize.width, y: 4*screenSize.height/8))
            self.gems.append(CGPoint(x: 3.5*screenSize.width, y: 5.4*screenSize.height/8))
            self.gems.append(CGPoint(x: 5*screenSize.width, y: 4.5*screenSize.height/8))
            self.gems.append(CGPoint(x: 7*screenSize.width, y: 7*screenSize.height/8))
            self.gems.append(CGPoint(x: 9*screenSize.width, y: 6.5*screenSize.height/8))
            self.gems.append(CGPoint(x: 11*screenSize.width, y: 4.2*screenSize.height/8))
            self.fueldrops.append(CGPoint(x: 1.1*screenSize.width, y: 7*screenSize.height/8))
            self.fueldrops.append(CGPoint(x: 3.5*screenSize.width, y: 1.5*screenSize.height/8))
            self.fueldrops.append(CGPoint(x: 5.9*screenSize.width, y: 2*screenSize.height/8))
            self.fueldrops.append(CGPoint(x: 8.5*screenSize.width, y: 4*screenSize.height/8))
        default:
        break
        }
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
