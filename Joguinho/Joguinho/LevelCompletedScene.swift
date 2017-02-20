//
//  LevelCompletedScene.swift
//  Joguinho
//
//  Created by Felipe Viberti on 17/11/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import SpriteKit
import SafariServices

class LevelCompletedScene: SKScene
{
    let semibackground = Component(imageNamed: "background")
    let background = Component(imageNamed: "gameWin")
    let platform = Component(imageNamed: "platform")
    let spaceship = Spaceship(fuelLevel: 1,spaceShipName:"rocket fase")
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
    var facebookButton:SKSpriteNode!
    
    override func didMove(to view: SKView) {
        
       setupInitialScene()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let transition = SKTransition.fade(withDuration: 1.0)
            
            if retry.contains(location) {
                let level = Level(id: levelId, planet: currentPlanet)
                let  scene = GameScene(size: self.size, level: level)
                let skView = self.view! as SKView
                skView.ignoresSiblingOrder = false
                scene.size = skView.bounds.size
                scene.scaleMode = .aspectFill
                skView.presentScene(scene, transition: transition)
            }
            
            if closeText.contains(location)
            {
                textFinal8.removeFromParent()
                closeText.removeFromParent()
            }
            
            if continueButton.contains(location) {
                
                if levelId != 8 && currentPlanet.name != PlanetName.Uranus
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
                    addChild(facebookButton)
                    
                }
                
            }
            
            if menu.contains(location) {
                let  scene = PlanetsScene(size: self.size)
                let skView = self.view! as SKView
                skView.ignoresSiblingOrder = false
                scene.size = skView.bounds.size
                scene.scaleMode = .aspectFill
                skView.presentScene(scene, transition: transition)
            }
            
            if facebookButton.contains(location) {
                let safarivc = SFSafariViewController(url: URL(string: "https://www.facebook.com/SpaceTripTheJourney/?ref=ts&fref=ts")!)
                self.view?.window?.rootViewController?.present(safarivc, animated: true, completion: nil)
            }
        }
    }

    //MARK:Setup Functions
    
    func setupInitialScene () {
        self.view?.isUserInteractionEnabled = true
        
        textFinal8.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        textFinal8.size = CGSize(width: 402.52 * size.width / 667, height: 310 * size.height / 375)
        textFinal8.zPosition = 21
        
        closeText = SKSpriteNode(imageNamed: "exit")
        closeText.position = CGPoint(x:500 * size.width / 667, y:300 * size.height / 375)
        closeText.zPosition = 22
        
        facebookButton = SKSpriteNode(imageNamed: "facebooklogo")
        facebookButton.position = CGPoint(x: 350 * size.width / 667, y: 43 * size.height / 375)
        facebookButton.zPosition = 22
        
        semibackground.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        semibackground.size = CGSize(width:size.width, height:size.height)
        semibackground.zPosition = 0
        addChild(semibackground)
        
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        background.size = CGSize(width: 402.52 * size.width / 667, height: 310 * size.height / 375)
        background.zPosition = 10
        addChild(background)
        
        platform.position = CGPoint(x: frame.size.width / 1.2, y: frame.size.height / 7)
        platform.zPosition = 15
        platform.size = CGSize(width: frame.size.width / 4, height: frame.size.height / 5)
        
        spaceship.position = CGPoint(x: frame.size.width / 1.2, y: frame.size.height / 4)
        spaceship.zPosition = 15
        
        
        continueButton.position =  CGPoint(x: 230 * size.width / 667, y: 70 * size.height / 375)
        continueButton.zPosition = 10
        addChild(continueButton)
        
        retry.position =  CGPoint(x: 360 * size.width / 667, y: 70 * size.height / 375)
        retry.zPosition = 10
        addChild(retry)
        
        menu.position =  CGPoint(x: 460 * size.width / 667, y: 70 * size.height / 375)
        menu.zPosition = 10
        addChild(menu)
        
        winLabel = SKLabelNode(fontNamed: "Futura-Bold")
        winLabel.text = NSLocalizedString("You_Won", comment: "YOU DID IT!")
        winLabel.fontSize = 25/568 * screenSize.width
        winLabel.fontColor = UIColor(red:0.82, green:0.01, blue:0.11, alpha:1.0)
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
        

       
        // addChild(platform)
        //  addChild(spaceship)
        // Só adicionar os outros childs depois da nave parar na plataforma
        //    let spaceshipLeftBoundsX = spaceship.position.x - spaceship.frame.width/2
        //        if spaceshipLeftBoundsX > screenSize.width {
        //
        //        }
       
      
        setUpScore()
        setUserDefaultsWhenCompletedLevel()
        
        //        self.surface = Component(imageNamed: "\(level.planet.name.rawValue)Surface")

    }
    
    
    func setUpScore() {
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
            
            numOfStars = 3
        } else if (Double(spaceShip.fuelLevel) >= (fuelDivFor3) && gemsCollected >= (gemsDivFor3)) || (Double(spaceShip.fuelLevel) >= (fuelDivFor3*2.0) && gemsCollected >= 0) || (Double(spaceShip.fuelLevel) >= 0 && gemsCollected >= (gemsDivFor3*2.0)) {
            //2 estrelas!!
            //setar a scoreStar bonitinha
            star = Component(imageNamed: "stars2")
            star.position = CGPoint (x: background.position.x, y: 120 * size.height / 375)
            star.zPosition = 11

            numOfStars = 2

        } else {
            //1 estrela loser total
            //setar a scoreStar bonitinha
            star = Component(imageNamed: "stars1")
            star.position = CGPoint (x: background.position.x, y: 120 * size.height / 375)
            star.zPosition = 11
            numOfStars = 1

        }
        self.addChild(star)
    }
    
    func nextLevelFound() -> Bool {
        
        for levelAux in levels[currentPlanet.index.rawValue] {
            print(levelAux)
            if (levelAux == String(level + 1)) {
                return true
            }
        }
        return false
    }
    
    //MARK:User Defaults functions
    
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
        
        
        if !nextLevelFound() {
            print("userDefault ", userDefaults.value(forKey: "lastLevel") as! Int)
            userDefaults.set(userDefaults.value(forKey: "lastLevel") as! Int + 1, forKey: "lastLevel")
            player.lastLevel = userDefaults.value(forKey: "lastLevel") as! Int!
            userDefaults.synchronize()
            
            if userDefaults.value(forKey: "lastLevel") as! Int % 8 == 0  {
    
                levels[currentPlanet.index.rawValue][7] = "8"
                levels[currentPlanet.index.rawValue + 1][0] = "1"
                
            } else {
//print(String(userDefaults.value(forKey: "lastLevel") as! Int % 8))
                levels[currentPlanet.index.rawValue][(userDefaults.value(forKey: "lastLevel") as! Int % 8) - 1 ] = String(userDefaults.value(forKey: "lastLevel") as! Int % 8)
            }
        }
        userDefaults.set(levels, forKey: "levels")
        userDefaults.synchronize()
    }
    
}
