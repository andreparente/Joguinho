//
//  GlobalVariables.swift
//  Joguinho
//
//  Created by Felipe Viberti on 23/11/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import Foundation
import SpriteKit

let userDefaults = UserDefaults.standard

//Variavél local para armazenar o avanço do usuário no jogo
var levels:[[String]] = [[]]

var levelsStars:[[Int]] = [[]]

//Level atual que o usuário está jogando
var levelId:Int? = 1

var spaceships:[Bool] = []

//Por enquanto spaceship,astronaut e o array de items são todos nil porque não criamos a loja do jogo ainda.

var player = Player(coinsBalance: userDefaults.value(forKey: "coinsBalance") as! Int, lastLevel: userDefaults.value(forKey: "lastLevel") as! Int, spaceShip: nil, astronaut: nil, itens: nil)


var currentPlanet:Planet!

//variavel que será usada pra guardar o que vier do CoreData, e usar essa variável pra povoar o app
var planetsGlobal: [Planet]!

var j = 0
var k = 0

let transition = SKTransition.fade(withDuration: 1.0)

var currentSpaceship:SpaceShipName = SpaceShipName.standardSpaceShip

var currentScene:GameScene!

var isPlaying:Bool! = false


func createBackButton (size:CGSize) -> SKSpriteNode {
     var back:SKSpriteNode!
     back = SKSpriteNode(imageNamed: "BackArrow2")
     back.position = CGPoint(x: 53 * size.width / 667, y: 340 * size.height / 375)
     back.color = UIColor.blue
     return back
}


func getArrayPlanets() -> [Planet] {
    
    var planetsAux: [Planet]
    var neptune,uranus,saturn,jupiter,mars,earth,venus,mercury: Planet
    
    neptune = Planet(name: PlanetName.Neptune, gravity: 0, type: PlanetType.gaseous, index: PlanetIndex.Neptune)
    neptune.info = "texto falando sobre netuno"
    neptune.shortInfo = "texto curto sobre netuno"
    
    uranus = Planet(name: PlanetName.Uranus, gravity: 0, type: PlanetType.gaseous, index: PlanetIndex.Uranus)
    uranus.info = "texto falando sobre Uranus"
    uranus.shortInfo = "texto curto sobre Uranus"
    
    saturn = Planet(name: PlanetName.Saturn, gravity: 0, type: PlanetType.gaseous, index: PlanetIndex.Saturn)
    saturn.info = "texto falando sobre Saturn"
    saturn.shortInfo = "texto curto sobre Saturn"
    
    jupiter = Planet(name: PlanetName.Jupiter, gravity: 0, type: PlanetType.gaseous, index: PlanetIndex.Jupiter)
    jupiter.info = "texto falando sobre Jupiter"
    jupiter.shortInfo = "texto curto sobre Jupiter"
    
    mars = Planet(name: PlanetName.Mars, gravity: 0, type: PlanetType.gaseous, index: PlanetIndex.Mars)
    mars.info = "texto falando sobre Mars"
    mars.shortInfo = "texto curto sobre Mars"
    
    earth = Planet(name: PlanetName.Earth, gravity: 0, type: PlanetType.gaseous, index: PlanetIndex.Earth)
    earth.info = "texto falando sobre Earth"
    earth.shortInfo = "texto curto sobre Earth"
    
    venus = Planet(name: PlanetName.Venus, gravity: 0, type: PlanetType.gaseous, index: PlanetIndex.Venus)
    venus.info = "texto falando sobre Venus"
    venus.shortInfo = "texto curto sobre Venus"
    
    mercury = Planet(name: PlanetName.Mercury, gravity: 0, type: PlanetType.gaseous, index: PlanetIndex.Mercury)
    mercury.info = "texto falando sobre mercury"
    mercury.shortInfo = "texto curto sobre mercury"
    
    planetsAux = [neptune,uranus,saturn,jupiter,mars,earth,venus,mercury]
    
    return planetsAux
}


