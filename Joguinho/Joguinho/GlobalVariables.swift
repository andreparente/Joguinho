//
//  GlobalVariables.swift
//  Joguinho
//
//  Created by Felipe Viberti on 23/11/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import Foundation

let userDefaults = UserDefaults.standard

//Variavél local para armazenar o avanço do usuário no jogo
var levels:[[String]] = [[]]

//Level atual que o usuário está jogando
var levelId:Int = 1

//Por enquanto spaceship,astronaut e o array de items são todos nil porque não criamos a loja do jogo ainda.

var player = Player(coinsBalance: userDefaults.value(forKey: "coinsBalance") as! Int, lastLevel: userDefaults.value(forKey: "lastLevel") as! Int, spaceShip: nil, astronaut: nil, itens: nil)


//MUDAR ESSA PORRA
var currentPlanet:Planet = Planet(name: PlanetName.Neptune, gravity: 1.115, type: PlanetType.gaseous,index:PlanetIndex.Neptune)

//variavel que será usada pra guardar o que vier do CoreData, e usar essa variável pra povoar o app
var planetsGlobal: [Planet]!

var j = 0
var k = 0

//Tipos de colisão que são tratados na GameScene
enum CollisionTypes: UInt32 {
    case player = 1
    case rock = 2
    case fuelDrop = 4
    case oxygenDrop = 8
    case gem = 16
}
