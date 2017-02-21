//
//  Enum.swift
//  Joguinho
//
//  Created by Felipe Viberti on 20/02/17.
//  Copyright © 2017 Andre Machado Parente. All rights reserved.
//

import Foundation

//MARK:Artifact Enums

enum Artifact:String {
    case oxygen = "Oxygen"
    case fuel = "Fuel"
}

//MARK:SpaceShip Enums

enum SpaceShipName:String {
    case standardSpaceShip = "rocket fase"
    case alienSpaceShip = "AlienShip"
    case starWarsSpaceship = "s"
    case carnivalSpaceship = ""
}

//MARK:Planet Enums

enum PlanetType:String {
    
    case gaseous = "Gaseous"
    case terrestrial = "Terrestrial"
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

//MARK:Clothing Enums

enum ClothingType: String {
    
    case Helmet = "Helmet"
    case UpperBody = "UpperBody"
    case LowerBody = "LowerBody"
    case Boot = "Boot"
}

//MARK:Piece Enums

enum PieceType: String {
    
    case Wing = "Wing"
    case Tank = "Tank"
    case Engine = "Engine"
}

//MARK:Tipos de colisão que são tratados na GameScene
enum CollisionTypes: UInt32 {
    case player = 1
    case rock = 2
    case fuelDrop = 4
    case oxygenDrop = 8
    case gem = 16
}
