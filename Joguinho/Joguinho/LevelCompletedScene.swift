//
//  LevelCompletedScene.swift
//  Joguinho
//
//  Created by Felipe Viberti on 17/11/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import SpriteKit


class LevelCompletedScene: SKScene
{
    let semibackground = Component(imageNamed: "background")
    let background = Component(imageNamed: "gameWin")
    let continueButton = Component(imageNamed: "continue")
    let retry = Component(imageNamed: "retry")
    var star: Component!
    var level: Int!
    var spaceShip: Spaceship!
    var gemsCollected: Double!
    var totalGems: Double!
    //var scoreStar = Component!
    
    override func didMove(to view: SKView) {
        
        setUserDefaultsWhenCompletedLevel()
        semibackground.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        semibackground.size = CGSize(width:size.width, height:size.height)
        semibackground.zPosition = 0
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        background.zPosition = 10
        continueButton.position =  CGPoint(x: 5*screenSize.width/4 / 3, y: 1*screenSize.height/5)
        continueButton.zPosition = 10
        retry.position = CGPoint(x: 6*screenSize.width/4 / 2 , y: 1*screenSize.height/5)
        retry.zPosition = 10
        addChild(semibackground)
        addChild(background)
        addChild(continueButton)
        addChild(retry)
        setUpScore()
    }
    
    
    func setUpScore() {
        print(spaceShip.fuelLevel)
        print("total de gems  ", totalGems)
        print("total coletado ", gemsCollected)
        let fuelDivFor3 = Double(350/3)
        let gemsDivFor3 = Double(totalGems/3)
        //setar a scoreStar bonitinha
        //setar a scoreStar bonitinha
        //setar a scoreStar bonitinha

        
        if (Double(spaceShip.fuelLevel) >= (fuelDivFor3*1.5) && gemsCollected >= (gemsDivFor3*1.5)) || (Double(spaceShip.fuelLevel) >= (fuelDivFor3*2.0) && gemsCollected >= (gemsDivFor3)) || (Double(spaceShip.fuelLevel) >= (fuelDivFor3) && gemsCollected >= (gemsDivFor3*2.0)) {
            //3 estrelas!!
            //setar a scoreStar bonitinha
            star = Component(imageNamed: "stars3")
            star.position = background.position
            star.zPosition = 11
            
            print("3 estrelas!!!!")
        } else if (Double(spaceShip.fuelLevel) >= (fuelDivFor3) && gemsCollected >= (gemsDivFor3)) || (Double(spaceShip.fuelLevel) >= (fuelDivFor3*2.0) && gemsCollected >= 0) || (Double(spaceShip.fuelLevel) >= 0 && gemsCollected >= (gemsDivFor3*2.0)) {
            //2 estrelas!!
            //setar a scoreStar bonitinha
            star = Component(imageNamed: "stars2")
            star.position = background.position
            star.zPosition = 11

            print("2 estrelas!!!!")

        } else {
            //1 estrela loser total
            //setar a scoreStar bonitinha
            star = Component(imageNamed: "stars1")
            star.position = background.position
            star.zPosition = 11

            print("1 estrela!!!!")
        }
        self.addChild(star)
    }
    
    func levelFound() -> Bool {
        
        for levelAux in levels[currentPlanet.index.rawValue] {
            if (levelAux == String(level + 1)) {
                return true
            }
        }
        return false
    }
    
    
    func setUserDefaultsWhenCompletedLevel() {
        
        if !levelFound() {
            userDefaults.set(userDefaults.value(forKey: "lastLevel") as! Int + 1, forKey: "lastLevel")
            player.lastLevel = userDefaults.value(forKey: "lastLevel") as! Int!
            levels[currentPlanet.index.rawValue][userDefaults.value(forKey: "lastLevel") as! Int - 1 ] = String(userDefaults.value(forKey: "lastLevel") as! Int)
            userDefaults.set(levels, forKey: "levels")
            print(levels)
            print(userDefaults.value(forKey: "levels") as! [[String]])
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if self.nodes(at: location)[0] == self.retry {
                let level = Level(id: levelId, planet: currentPlanet)
                let  scene = GameScene(size: self.size, level: level)
                let skView = self.view! as SKView
                skView.ignoresSiblingOrder = false
                scene.size = skView.bounds.size
                scene.scaleMode = .aspectFill
                skView.presentScene(scene)
            }
            
            if self.nodes(at: location)[0] == self.continueButton {
                //Esse if aqui é só pra não dar crash por enquanto que não tem level 5
                if levelId == 1 || levelId == 2 || levelId == 3
                {
                levelId = levelId! + 1
                let level = Level(id: levelId , planet: currentPlanet)
                let  scene = GameScene(size: self.size, level: level)
                let skView = self.view! as SKView
                skView.ignoresSiblingOrder = false
                scene.size = skView.bounds.size
                scene.scaleMode = .aspectFill
                skView.presentScene(scene)
                }
            }
        }
    }

}
