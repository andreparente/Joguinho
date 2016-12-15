//
//  PlanetsScene.swift
//  Joguinho
//
//  Created by Felipe Viberti on 16/11/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import SpriteKit

class PlanetsScene: SKScene{
    
    var instructionLabel: SKLabelNode!
    var gemsLabel: SKLabelNode!
    var gem: Component!
    var neptune: Component!
    var uranus: Component!
    var saturn: Component!
    var jupiter: Component!
    var mars: Component!
    var earth: Component!
    var venus: Component!
    var mercury: Component!
    var soundButton: SKSpriteNode!
    var buttonTexture: SKTexture!
    
    
    override func didMove(to view: SKView) {
        
        let size = view.frame.size

        
        if userDefaults.bool(forKey: "soundOn") {
            buttonTexture = SKTexture(imageNamed: "soundOn")
            soundButton = SKSpriteNode(texture: buttonTexture)
            soundButton.position = CGPoint(x: 550 * size.width / 667, y: 43 * size.height / 375)
            soundButton.zPosition = 3
            self.addChild(soundButton)
        } else {
            buttonTexture = SKTexture(imageNamed: "soundOff")
            soundButton = SKSpriteNode(texture: buttonTexture)
            soundButton.position = CGPoint(x: 550 * size.width / 667, y: 43 * size.height / 375)
            soundButton.zPosition = 3
            self.addChild(soundButton)
        }
        
        
        instructionLabel = SKLabelNode(fontNamed: "Futura")
        instructionLabel.text = NSLocalizedString("Planet_Instruction", comment: "Select a Planet")
        instructionLabel.fontSize = 30/568 * screenSize.width
        instructionLabel.position = CGPoint(x: instructionLabel.frame.size.width/2 + 20, y: screenSize.height - 40)
        instructionLabel.zPosition = 2
        self.addChild(instructionLabel)
        
        gemsLabel = SKLabelNode(fontNamed: "Futura")
        let balance = userDefaults.value(forKey: "coinsBalance") as! Int
        gemsLabel.text = NSLocalizedString("Total_Coins", comment: "Total coins: ") + String(balance) + " x "
        gemsLabel.fontSize = 15/568 * screenSize.width
        gemsLabel.position = CGPoint(x: gemsLabel.frame.size.width/2 + 20, y: gemsLabel.frame.size.height/2)
        gemsLabel.zPosition = 3
        self.addChild(gemsLabel)
        
        gem = Component(imageNamed: "crystal")
        let labelPosition = gemsLabel.position
        let labelSize = gemsLabel.frame.size
        gem.position = CGPoint(x: labelPosition.x + labelSize.width/2 + 10, y: labelPosition.y + 10)
        gem.zPosition = 2
        gem.size = CGSize(width: gem.size.width/2, height: gem.size.height/2)
        addChild(gem)
        
        
        levels = userDefaults.value(forKey: "levels") as! [[String]]
        levelsStars = userDefaults.value(forKey: "levelStars") as! [[Int]]
        //background
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        background.size = CGSize(width: 667 * size.width / 667, height: 375 * size.height / 375)
        addChild(background)
        
        
        //neptune
        neptune = Component(imageNamed: "Neptune")
        neptune.position = CGPoint(x: 50.5 * size.width / 667, y: frame.size.height / 2)
        neptune.size = CGSize(width: 49 * size.width / 667, height: 49 * size.height / 375)
        addChild(neptune)
        
        if levels[PlanetIndex.Uranus.rawValue][0] == "lock" {
        //Uranus blocked
        uranus = Component(imageNamed: "uranusShade")
        }
        else {
            //uranus
             uranus = Component(imageNamed: "Uranus")
        }
        
        uranus.position = CGPoint(x: 124.5 * size.width / 667, y: frame.size.height / 2)
        uranus.size = CGSize(width: 51 * size.width / 667, height: 65 * size.height / 375)
        addChild(uranus)

        if levels[PlanetIndex.Saturn.rawValue][0] == "lock" {
            //Saturn blocked
            saturn = Component(imageNamed: "saturnShade")
        }
        else {
            //saturn
             saturn = Component(imageNamed: "Saturn")
        }
        
        saturn.position = CGPoint(x: 237 * size.width / 667, y: frame.size.height / 2)
        saturn.size = CGSize(width: 158 * size.width / 667, height: 116 * size.height / 375)
        addChild(saturn)
        
        if levels[PlanetIndex.Jupiter.rawValue][0] == "lock" {
            //Jupiter blocked
            jupiter = Component(imageNamed: "jupiterShade")
           
        }
        else {
            //jupiter
            jupiter = Component(imageNamed: "Jupiter")
        }
        
        jupiter.position = CGPoint(x: 393 * size.width / 667, y: frame.size.height / 2)
        jupiter.size = CGSize(width: 140 * size.width / 667, height: 140 * size.height / 375)
        addChild(jupiter)
        
        if levels[PlanetIndex.Mars.rawValue][0] == "lock" {
            //Mars blocked
            mars = Component(imageNamed: "marsShade")
        }
        else {
            //mars
             mars = Component(imageNamed: "Mars")
        }
        mars.position = CGPoint(x: 489.5 * size.width / 667, y: frame.size.height / 2)
        mars.size = CGSize(width: 7 * size.width / 667, height: 7 * size.height / 375)
        addChild(mars)

        
        if levels[PlanetIndex.Earth.rawValue][0] == "lock" {
            //Earth blocked
            earth = Component(imageNamed: "terraShade")
        }
        else {
            //earth
             earth = Component(imageNamed: "Earth")
        }
        
        earth.position = CGPoint(x: 520.5 * size.width / 667, y: frame.size.height / 2)
        earth.size = CGSize(width: 13 * size.width / 667, height: 13 * size.height / 375)
        addChild(earth)
        
        if levels[PlanetIndex.Venus.rawValue][0] == "lock" {
             //Venus blocked
            venus = Component(imageNamed: "venusShade")
        }
        else {
            //venus
             venus = Component(imageNamed: "Venus")
        }
            

        venus.position = CGPoint(x: 551.5 * size.width / 667, y: frame.size.height / 2)
        venus.size = CGSize(width: 13 * size.width / 667, height: 13 * size.height / 375)
        addChild(venus)
        
        if levels[PlanetIndex.Venus.rawValue][0] == "lock" {
            //mercuryShade
            mercury = Component(imageNamed: "mercuryShade")

        }
        else {
            //mercury
            mercury = Component(imageNamed: "Mercury")
        }
        mercury.position = CGPoint(x: 580.5 * size.width / 667, y: frame.size.height / 2)
        mercury.size = CGSize(width: 5 * size.width / 667, height: 5 * size.height / 375)
        addChild(mercury)
        //sun
        let sun = SKSpriteNode(imageNamed: "Sun")
        sun.position = CGPoint(x: 844 * size.width / 667, y: frame.size.height / 2)
        sun.size = CGSize(width: 466 * size.width / 667, height: 466 * size.height / 375)
        addChild(sun)
        
        
    }
    
    
    //FUNCAO USADA PARA ACHAR QUAL BOTAO/PLANETA FOI SELECIONADO!
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            // Get the location of the touch in this scene
            let location = (touch as AnyObject).location(in: self)
            // Check if the location of the touch is within the button's bounds
            
            if soundButton.contains(location) {
                if userDefaults.bool(forKey: "soundOn") {
                    soundButton.texture = SKTexture(imageNamed:"soundOff")
                    userDefaults.set(false, forKey: "soundOn")
                } else {
                    soundButton.texture = SKTexture(imageNamed:"soundOn")
                    userDefaults.set(true, forKey: "soundOn")
                }
            }
            if neptune.contains(location) {
                
                currentPlanet = Planet(name: PlanetName.Neptune, gravity: 1.15, type: PlanetType.gaseous,index:PlanetIndex.Neptune)
                let transition2 = SKTransition.fade(withDuration: 1.0)
                let nextScene = SelectedPlanetScene(size: self.size)
                nextScene.scaleMode = SKSceneScaleMode.aspectFill
                nextScene.selectedPlanetClass = currentPlanet
                self.scene?.view?.presentScene(nextScene, transition: transition2)
            }
        }
    }
}
