//
//  SelectedPlanetScene.swift
//  Joguinho
//
//  Created by Felipe Viberti on 16/11/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import SpriteKit

class SelectedPlanetScene: SKScene {

    var background: SKNode!
    var level1: SKNode!
    var level2: SKNode!
    var level3: SKNode!
    var level4: SKNode!
    var level5: SKNode!
    var level6: SKNode!
    var level7: SKNode!
    var level8: SKNode!
    var selectedPlanet: SKNode!
    var planetLabel: SKLabelNode!
    var selectedPlanetClass: Planet!

    override func didMove(to view: SKView) {
        
        background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: screenSize.width/2, y: 2*screenSize.height/3)
        self.addChild(background)

        
        selectedPlanet = SKSpriteNode(imageNamed: "Neptune")
        selectedPlanet.position = CGPoint(x: 1*screenSize.width/8, y: screenSize.height/2)
        self.addChild(selectedPlanet)
        
        planetLabel = SKLabelNode(fontNamed: "Futura-Bold")
        planetLabel.text = selectedPlanetClass.name.rawValue
        planetLabel.fontSize = 35
        planetLabel.position = CGPoint(x: screenSize.width/2, y: 4*screenSize.height/5)
        self.addChild(planetLabel)
        
        level1 = SKSpriteNode(imageNamed: "1")
        level1.position = CGPoint(x: 3*screenSize.width/4 / 2, y: 2*screenSize.height/3)
        self.addChild(level1)
        
        level2 = SKSpriteNode(imageNamed: "2")
        level2.position = CGPoint(x: 4*screenSize.width/4 / 2, y: 2*screenSize.height/3)
        self.addChild(level2)
        
        level3 = SKSpriteNode(imageNamed: "3")
        level3.position = CGPoint(x: 5*screenSize.width/4 / 2, y: 2*screenSize.height/3)
        self.addChild(level3)
        
        level4 = SKSpriteNode(imageNamed: "4")
        level4.position = CGPoint(x: 6*screenSize.width/4 / 2, y: 2*screenSize.height/3)
        self.addChild(level4)
        
        level5 = SKSpriteNode(imageNamed: "5")
        level5.position = CGPoint(x: 3*screenSize.width/4 / 2, y: 1*screenSize.height/3)
        self.addChild(level5)
        
        level6 = SKSpriteNode(imageNamed: "6")
        level6.position = CGPoint(x: 4*screenSize.width/4  / 2, y: 1*screenSize.height/3)
        self.addChild(level6)
        
        level7 = SKSpriteNode(imageNamed: "7")
        level7.position = CGPoint(x: 5*screenSize.width/4 / 2, y: 1*screenSize.height/3)
        self.addChild(level7)
        
        level8 = SKSpriteNode(imageNamed: "8")
        level8.position = CGPoint(x: 6*screenSize.width/4 / 2, y: 1*screenSize.height/3)
        self.addChild(level8)
    }
}
