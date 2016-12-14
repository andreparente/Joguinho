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
    let platform = Component(imageNamed: "platform")
    let spaceship = Spaceship(fuelLevel: 1)
    let continueButton = Component(imageNamed: "continue")
    let retry = Component(imageNamed: "retry")
    let menu = Component(imageNamed: "menu")
    var star: Component!
    var level: Int!
    var spaceShip: Spaceship!
    var gemsCollected: Double!
    var totalGems: Double!
    var numOfStars: Int = 0
    var winLabel: SKLabelNode!
    var winMessage: SKLabelNode!
    var textFinal8 = Component(imageNamed: NSLocalizedString("Final_Description_Image", comment: "Description"))
    var closeText: SKNode!

    
    override func didMove(to view: SKView) {
        self.view?.isUserInteractionEnabled = true
        
        textFinal8.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        textFinal8.size = CGSize(width: 402.52 * size.width / 667, height: 310 * size.height / 375)
        textFinal8.zPosition = 21
        
        closeText = SKSpriteNode(imageNamed: "exit")
        closeText.position = CGPoint(x:500 * size.width / 667, y:300 * size.height / 375)
        closeText.zPosition = 22
        
        semibackground.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        semibackground.size = CGSize(width:size.width, height:size.height)
        semibackground.zPosition = 0
        
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        background.size = CGSize(width: 402.52 * size.width / 667, height: 310 * size.height / 375)
        background.zPosition = 10
        
        platform.position = CGPoint(x: frame.size.width / 1.2, y: frame.size.height / 7)
        platform.zPosition = 15
        platform.size = CGSize(width: frame.size.width / 4, height: frame.size.height / 5)
        
        spaceship.position = CGPoint(x: frame.size.width / 1.2, y: frame.size.height / 4)
        spaceship.zPosition = 15
        
//        continueButton.position =  CGPoint(x: 5*screenSize.width/4 / 2.3, y: 1*screenSize.height/5)
        continueButton.position =  CGPoint(x: 230 * size.width / 667, y: 70 * size.height / 375)
        continueButton.zPosition = 10
        
//        retry.position = CGPoint(x: 6*screenSize.width/4 / 2 , y: 1*screenSize.height/5)
        retry.position =  CGPoint(x: 360 * size.width / 667, y: 70 * size.height / 375)
        retry.zPosition = 10
        
//        menu.position = CGPoint(x: 5*screenSize.width/4 / 4.3, y: 1*screenSize.height/5)
        menu.position =  CGPoint(x: 460 * size.width / 667, y: 70 * size.height / 375)
        menu.zPosition = 10
        
        winLabel = SKLabelNode(fontNamed: "Futura-Bold")
        winLabel.text = NSLocalizedString("You_Won", comment: "YOU DID IT!")
        winLabel.fontSize = 25/568 * screenSize.width
        winLabel.fontColor = UIColor(red:0.82, green:0.01, blue:0.11, alpha:1.0)
//        winLabel.position = CGPoint(x: screenSize.width/2, y: background.position.y + 3.5*winLabel.frame.height)
        winLabel.position = CGPoint(x: screenSize.width/2, y: background.position.y + 100 * size.height / 375)
        winLabel.zPosition = 20
        addChild(winLabel)
        
        winMessage = SKLabelNode(fontNamed: "Futura")
        winMessage.text = NSLocalizedString("Won_Message", comment: "congratulations, you rock")
        winMessage.fontSize = 18/568 * screenSize.width
        winMessage.fontColor = UIColor(red:0.09, green:0.01, blue:0.27, alpha:1.0)
        winMessage.position = CGPoint(x: screenSize.width/2, y: winLabel.position.y - winMessage.frame.height/2 - 15)
        winMessage.zPosition = 20
        addChild(winMessage)
        
        addChild(semibackground)
        addChild(background)
        addChild(menu)
       // addChild(platform)
      //  addChild(spaceship)
        // Só adicionar os outros childs depois da nave parar na plataforma
    //    let spaceshipLeftBoundsX = spaceship.position.x - spaceship.frame.width/2
//        if spaceshipLeftBoundsX > screenSize.width {
//            
//        }
        addChild(continueButton)
        addChild(retry)
        setUpScore()
        setUserDefaultsWhenCompletedLevel()
        
        //        self.surface = Component(imageNamed: "\(level.planet.name.rawValue)Surface")



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
            star.position = CGPoint (x: background.position.x, y: 120 * size.height / 375)
                //background.position
            star.zPosition = 11
            
            print("3 estrelas!!!!")
            numOfStars = 3
        } else if (Double(spaceShip.fuelLevel) >= (fuelDivFor3) && gemsCollected >= (gemsDivFor3)) || (Double(spaceShip.fuelLevel) >= (fuelDivFor3*2.0) && gemsCollected >= 0) || (Double(spaceShip.fuelLevel) >= 0 && gemsCollected >= (gemsDivFor3*2.0)) {
            //2 estrelas!!
            //setar a scoreStar bonitinha
            star = Component(imageNamed: "stars2")
            star.position = CGPoint (x: background.position.x, y: 120 * size.height / 375)
            star.zPosition = 11

            print("2 estrelas!!!!")
            numOfStars = 2

        } else {
            //1 estrela loser total
            //setar a scoreStar bonitinha
            star = Component(imageNamed: "stars1")
            star.position = CGPoint (x: background.position.x, y: 120 * size.height / 375)
            star.zPosition = 11

            print("1 estrela!!!!")
            numOfStars = 1

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
        if level % 8 != 0 {
              if levelsStars[currentPlanet.index.rawValue][level % 8 - 1 ] < numOfStars {
        levelsStars[currentPlanet.index.rawValue][level % 8 - 1 ] = numOfStars
              }
        }
        else {
            if levelsStars[currentPlanet.index.rawValue][7] < numOfStars {
            levelsStars[currentPlanet.index.rawValue][7] = numOfStars
            }
        }
        
        userDefaults.set(levelsStars, forKey: "levelStars")
        print(userDefaults.value(forKey: "levelStars") as! [[Int]])
        
        
        if !levelFound() {
            userDefaults.set(userDefaults.value(forKey: "lastLevel") as! Int + 1, forKey: "lastLevel")
            player.lastLevel = userDefaults.value(forKey: "lastLevel") as! Int!
            
            if userDefaults.value(forKey: "lastLevel") as! Int % 8 == 0  {
    
                levels[currentPlanet.index.rawValue][7] = "8"
                levels[currentPlanet.index.rawValue + 1][0] = "1"
                
            } else {
                levels[currentPlanet.index.rawValue][(userDefaults.value(forKey: "lastLevel") as! Int % 8) - 1 ] = String(userDefaults.value(forKey: "lastLevel") as! Int % 8)
            }
        }
        userDefaults.set(levels, forKey: "levels")
        print(levels)
        print(userDefaults.value(forKey: "levels") as! [[String]])
        print(userDefaults.value(forKey: "levelStars") as! [[Int]])
        userDefaults.synchronize()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let transition = SKTransition.fade(withDuration: 1.0)

            if self.nodes(at: location)[0] == self.retry {
                let level = Level(id: levelId, planet: currentPlanet)
                let  scene = GameScene(size: self.size, level: level)
                let skView = self.view! as SKView
                skView.ignoresSiblingOrder = false
                scene.size = skView.bounds.size
                scene.scaleMode = .aspectFill
                skView.presentScene(scene, transition: transition)
            }
            
            if self.nodes(at: location)[0] == self.closeText
            {
                textFinal8.removeFromParent()
                closeText.removeFromParent()
            }
            
            if self.nodes(at: location)[0] == self.continueButton {
                //Esse if aqui é só pra não dar crash por enquanto que não tem level 5
//                if levelId != 8
                if levelId != 8
                {
                levelId = levelId! + 1
                let level = Level(id: levelId , planet: currentPlanet)
                let  scene = GameScene(size: self.size, level: level)
                let skView = self.view! as SKView
                skView.ignoresSiblingOrder = false
                scene.size = skView.bounds.size
                scene.scaleMode = .aspectFill
                skView.presentScene(scene, transition: transition)
                }
                else{
                    addChild(textFinal8)
                    addChild(closeText)
                }

            }
            
            if self.nodes(at: location)[0] == self.menu {
                let  scene = PlanetsScene(size: self.size)
                let skView = self.view! as SKView
                skView.ignoresSiblingOrder = false
                scene.size = skView.bounds.size
                scene.scaleMode = .aspectFill
                skView.presentScene(scene, transition: transition)
            }
        }
    }

}
