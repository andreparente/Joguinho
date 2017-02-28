//
//  SelectedPlanetScene.swift
//  Joguinho
//
//  Created by Felipe Viberti on 16/11/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import SpriteKit


class SelectedPlanetScene: SKScene {

    var level1: SKNode!
    var level2: SKNode!
    var level3: SKNode!
    var level4: SKNode!
    var level5: SKNode!
    var level6: SKNode!
    var level7: SKNode!
    var level8: SKNode!
    var selectedPlanet: SKSpriteNode!
    var moreInfo: SKSpriteNode!
    var planetLabel: SKLabelNode!
    var back: SKSpriteNode!
    var selectedPlanetClass: Planet!
    var textAboutPlanet:SKNode!
    var closeText:SKNode!
    var descriptionLabel: SKLabelNode!
    var levelStarsImages:[Component] = []
    var numberOfGemsCurrentPlanet:SKLabelNode!
    var trader:Component!
    
    override func didMove(to view: SKView) {
        
        setupInitialScene()
        
        setSpriteForLevels()
        
        setPositionsForLevels()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches
        {
            let location = touch.location(in: self)
            //Quando criar outro level adicionar nesse switch
            switch self.nodes(at: location)[0] {
            case level1:
            if !levelIsLocked(levelNumber: 0) {
            levelId = 1
            }
            else {
                levelId = nil
            }
            case level2:
            if !levelIsLocked(levelNumber: 1) {
            levelId = 2
            }
            else {
            levelId = nil
            }
            case level3:
            if !levelIsLocked(levelNumber: 2) {
            levelId = 3
            }
            else {
                levelId = nil
            }
            case level4:
            if !levelIsLocked(levelNumber: 3) {
            levelId = 4
            }
            else {
                levelId = nil
            }
            case level5:
            if !levelIsLocked(levelNumber: 4) {
                levelId = 5
            }
            else {
                levelId = nil
            }
            case level6:
            if !levelIsLocked(levelNumber: 5) {
                levelId = 6
            }
            else {
                levelId = nil
            }
            case level7:
            if !levelIsLocked(levelNumber: 6) {
                levelId = 7
            }
            else {
                levelId = nil
            }
            case level8:
            if !levelIsLocked(levelNumber: 7) {
                levelId = 8
            }
            else {
                levelId = nil
            }
            default:
            levelId = nil
            }
            
            if levelId != nil {
            let level = Level(id: levelId, planet: currentPlanet)
            let scene = GameScene(size: self.size, level: level)
            let skView = self.view! as SKView
            skView.ignoresSiblingOrder = false
            scene.size = skView.bounds.size
            scene.scaleMode = .aspectFill
            skView.presentScene(scene, transition: transition)
            }
            
            if back.contains(location){
                let scene = PlanetsScene()
                let skView = self.view! as SKView
                skView.ignoresSiblingOrder = false
                scene.size = skView.bounds.size
                scene.scaleMode = .aspectFill
                skView.presentScene(scene, transition: transition)
            }
            
            if moreInfo.contains(location)
            {
                addChild(textAboutPlanet)
                addChild(closeText)
               
                hideAll()
            }
            
            if closeText.contains(location)
            {
                textAboutPlanet.removeFromParent()
                closeText.removeFromParent()
                
                showAll()

            }
            
            if trader.contains(location) {
                actWhenTrade()
            }
        }
    }
    
    //MARK:Setup Functions
    
    func setupInitialScene() {
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        background.size = CGSize(width: 667 * size.width / 667, height: 375 * size.height / 375)
        addChild(background)
        
        
        back = createBackButton(size: self.size)
        self.addChild(back)
        
        setNumberOfGemsCurrentPlanet()
        
        trader = Component(imageNamed: "\(currentPlanet.name.rawValue)Exchange")
        trader.position = CGPoint(x: 116 * size.width / 667, y: 40 * size.height / 375)
        addChild(trader)
        
        selectedPlanet = SKSpriteNode(imageNamed: "Big"+selectedPlanetClass.name.rawValue)
        selectedPlanet.position = CGPoint(x: 116 * size.width / 667, y: 220 * size.height / 375)
        //selectedPlanet.size = CGSize(width: 188 * size.width / 667, height: 188 * size.height / 375)
        self.addChild(selectedPlanet)
        
        
        moreInfo = SKSpriteNode(imageNamed: "moreInfo2")
        moreInfo.position = CGPoint(x: 60 * size.width / 667, y: 129 * size.height / 375)
        moreInfo.size = CGSize(width: 55 * size.width / 667, height: 55 * size.height / 375)
        self.addChild(moreInfo)
        
        planetLabel = SKLabelNode(fontNamed: "Futura-Bold")
        planetLabel.text = NSLocalizedString("\(selectedPlanetClass.name.rawValue)",comment:"Planet Name")
        planetLabel.fontSize = 27
        planetLabel.position = CGPoint(x: 0.95*screenSize.width/2, y: 4*screenSize.height/5)
        self.addChild(planetLabel)
        
        
        descriptionLabel = SKLabelNode(fontNamed: "Futura")
        descriptionLabel.text = NSLocalizedString(selectedPlanetClass.name.rawValue + "_Description", comment: "Description")
        descriptionLabel.fontSize = 20
        descriptionLabel.position = CGPoint(x: planetLabel.position.x  + planetLabel.frame.width/2 + descriptionLabel.frame.width/2 + 15, y: planetLabel.position.y)
        self.addChild(descriptionLabel)
        
        
        closeText = SKSpriteNode(imageNamed: "exit")
        closeText.position = CGPoint(x:620 * screenSize.width / 667,y:315 * screenSize.height / 375)
        closeText.zPosition = 11
        
        
        textAboutPlanet = SKSpriteNode(imageNamed: NSLocalizedString(selectedPlanetClass.name.rawValue + "_Description_Image", comment: "Description"))
        textAboutPlanet.position = CGPoint(x: screenSize.width / 2, y: screenSize.height / 2 + 10)
        switch screenSize.width
        {
        case 667:
            textAboutPlanet.setScale(1.2)
        case 736:
            textAboutPlanet.setScale(1.4)
        default:
            break
        }
        textAboutPlanet.zPosition = 10
        
        
        for i in 0...7
        {
            let numStars = levelsStars[currentPlanet.index.rawValue][i]
            if numStars == 0 {
                break
            }
            levelStarsImages.append(Component(imageNamed: "miniStars\(numStars)"))
        }
        var f = 0
        for _ in levelStarsImages
        {
            if levelStarsImages[f].imageNamed != nil
            {
                switch f
                {
                case 0:
                    levelStarsImages[f].position = CGPoint(x: 281 * size.width / 667, y: 180 * size.height / 375)
                case 1:
                    levelStarsImages[f].position = CGPoint(x: 378 * size.width / 667, y: 180 * size.height / 375)
                case 2:
                    levelStarsImages[f].position = CGPoint(x: 475 * size.width / 667, y: 180 * size.height / 375)
                case 3:
                    levelStarsImages[f].position =  CGPoint(x: 572 * size.width / 667, y: 180 * size.height / 375)
                case 4:
                    levelStarsImages[f].position  = CGPoint(x: 281 * size.width / 667, y: 70 * size.height / 375)
                case 5:
                    levelStarsImages[f].position = CGPoint(x: 378 * size.width / 667, y: 70 * size.height / 375)
                case 6:
                    levelStarsImages[f].position =  CGPoint(x: 475 * size.width / 667, y: 70 * size.height / 375)
                case 7:
                    levelStarsImages[f].position = CGPoint(x: 572 * size.width / 667, y: 70 * size.height / 375)
                default:
                    break
                }
                self.addChild(levelStarsImages[f])
                f += 1
            }
        }

    }
    
    func setSpriteForLevels() {
        
        level1 = SKSpriteNode(imageNamed: levels[currentPlanet.index.rawValue][0])
        
        
        level2 = SKSpriteNode(imageNamed: levels[currentPlanet.index.rawValue][1])
        
        level3 = SKSpriteNode(imageNamed: levels[currentPlanet.index.rawValue][2])
        
        level4 = SKSpriteNode(imageNamed: levels[currentPlanet.index.rawValue][3])
        
        
        level5 = SKSpriteNode(imageNamed: levels[currentPlanet.index.rawValue][4])
        
        
        level6 = SKSpriteNode(imageNamed: levels[currentPlanet.index.rawValue][5])
        
        
        level7 = SKSpriteNode(imageNamed: levels[currentPlanet.index.rawValue][6])
        
        
        level8 = SKSpriteNode(imageNamed: levels[currentPlanet.index.rawValue][7])

    }
    
    func setPositionsForLevels() {
        level1.position = CGPoint(x: 281 * size.width / 667, y: 220 * size.height / 375)
        self.addChild(level1)
        
        level2.position = CGPoint(x: 378 * size.width / 667, y: 220 * size.height / 375)
        self.addChild(level2)
        
        level3.position = CGPoint(x: 475 * size.width / 667, y: 220 * size.height / 375)
        self.addChild(level3)
        
        level4.position = CGPoint(x: 572 * size.width / 667, y: 220 * size.height / 375)
        self.addChild(level4)
        
        level5.position = CGPoint(x: 281 * size.width / 667, y: 110 * size.height / 375)
        self.addChild(level5)
        
        level6.position = CGPoint(x: 378 * size.width / 667, y: 110 * size.height / 375)
        self.addChild(level6)
        
        level7.position = CGPoint(x: 475 * size.width / 667, y: 110 * size.height / 375)
        self.addChild(level7)
        
        level8.position = CGPoint(x: 572 * size.width / 667, y: 110 * size.height / 375)
        self.addChild(level8)
    }
    
    func hideAll () {
        level1.isHidden = true
        level2.isHidden = true
        level3.isHidden = true
        level4.isHidden = true
        level5.isHidden = true
        level6.isHidden = true
        level7.isHidden = true
        level8.isHidden = true
        back.isHidden = true
        numberOfGemsCurrentPlanet.isHidden = true
        trader.isHidden = true
        
        for star in levelStarsImages {
            star.isHidden = true
        }
        moreInfo.isHidden = true
    }
    
    func showAll() {
        level1.isHidden = false
        level2.isHidden = false
        level3.isHidden = false
        level4.isHidden = false
        level5.isHidden = false
        level6.isHidden = false
        level7.isHidden = false
        level8.isHidden = false
        back.isHidden = false
        numberOfGemsCurrentPlanet.isHidden = false
        trader.isHidden = false
        
        for star in levelStarsImages {
            star.isHidden = false
        }
        moreInfo.isHidden = false

    }
    
    func setNumberOfGemsCurrentPlanet () {
        
        numberOfGemsCurrentPlanet = SKLabelNode(fontNamed: "Futura")
        numberOfGemsCurrentPlanet.fontSize = 15
        numberOfGemsCurrentPlanet.position = CGPoint(x: 520 * size.width / 667, y: 30 * size.height / 375)
        numberOfGemsCurrentPlanet.text = NSLocalizedString("Total_Gems", comment: "Total Gems") + "\(userDefaults.value(forKey: "\(currentPlanet.name.rawValue)Gems")!)"
        addChild(numberOfGemsCurrentPlanet)

    }
    
    func actWhenTrade() {
        let alert=UIAlertController(title:NSLocalizedString("Confirm_Trade_Title", comment: "confirm"), message: NSLocalizedString("Confirm_Trade_Description", comment: "confirm"), preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (alert: UIAlertAction!) in
            self.actWhenTradeSuccess()
        }))
        self.view?.window?.rootViewController?.present(alert,animated: true, completion: nil)
    }
    
    func actWhenTradeSuccess () {
        let totalCoins = userDefaults.value(forKey: "coinsBalance") as! Int
        var valueExchanged:Int = 0
        if currentPlanet.name.rawValue == "Neptune" {
        valueExchanged = userDefaults.value(forKey: "NeptuneGems") as! Int
        }
        if currentPlanet.name.rawValue == "Uranus" {
        valueExchanged = userDefaults.value(forKey: "UranusGems") as! Int * 2
        }
        
        userDefaults.set(valueExchanged + totalCoins, forKey: "coinsBalance")
        userDefaults.set(0, forKey: "\(currentPlanet.name.rawValue)Gems")
        userDefaults.synchronize()
        
        numberOfGemsCurrentPlanet.removeFromParent()
        setNumberOfGemsCurrentPlanet()
    }
    
    func levelIsLocked(levelNumber:Int) ->Bool {
        if levels[currentPlanet.index.rawValue][levelNumber] == "lockLayer" {
            print(levels[currentPlanet.index.rawValue][levelNumber])
            return true
        }
        return false
    }
}
