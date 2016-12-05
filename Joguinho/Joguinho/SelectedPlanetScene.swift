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
    
    
    override func didMove(to view: SKView) {
        
        let size = view.frame.size
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
       background.size = CGSize(width: 667 * size.width / 667, height: 375 * size.height / 375)
        addChild(background)
        
        back = SKSpriteNode(imageNamed: "BackArrow")
        back.position = CGPoint(x: 53 * size.width / 667, y: 350 * size.height / 375)
        back.color = UIColor.blue
      //  back.size = CGSize(width: 58 * size.width / 667, height: 22 * size.height / 375)
        self.addChild(back)

        selectedPlanet = SKSpriteNode(imageNamed: selectedPlanetClass.name.rawValue)
        selectedPlanet.position = CGPoint(x: 116 * size.width / 667, y: 220 * size.height / 375)
        selectedPlanet.size = CGSize(width: 188 * size.width / 667, height: 188 * size.height / 375)
        self.addChild(selectedPlanet)
        
        moreInfo = SKSpriteNode(imageNamed: "moreInfo")
        moreInfo.position = CGPoint(x: 60 * size.width / 667, y: 129 * size.height / 375)
        moreInfo.size = CGSize(width: 55 * size.width / 667, height: 55 * size.height / 375)
        self.addChild(moreInfo)
        
        
        planetLabel = SKLabelNode(fontNamed: "Futura-Bold")
        planetLabel.text = NSLocalizedString("\(selectedPlanetClass.name.rawValue)",comment:"Planet Name")
        planetLabel.fontSize = 27
        planetLabel.position = CGPoint(x: 0.95*screenSize.width/2, y: 4*screenSize.height/5)
        self.addChild(planetLabel)
        
        descriptionLabel = SKLabelNode(fontNamed: "Futura")
        descriptionLabel.text = NSLocalizedString("Neptune_Description", comment: "Description")
        descriptionLabel.fontSize = 20
        descriptionLabel.position = CGPoint(x: planetLabel.position.x  + planetLabel.frame.width/2 + descriptionLabel.frame.width/2 + 15, y: planetLabel.position.y)
        self.addChild(descriptionLabel)
        
        setSpriteForLevels()
        
        setPositionsForLevels()
        
        
        closeText = SKSpriteNode(imageNamed: "exit")
        closeText.position = CGPoint(x:572 * size.width / 667,y:110 * size.height / 375)
        closeText.zPosition = 10
        
        textAboutPlanet = SKSpriteNode(imageNamed: "textNeptune")
        textAboutPlanet.position = CGPoint(x: size.width / 2, y: size.height / 2)
        textAboutPlanet.zPosition = 10

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches
        {
            let location = touch.location(in: self)
            //Quando criar outro level adicionar nesse switch
            switch self.nodes(at: location)[0] {
            case level1:
            levelId = 1
            case level2:
            levelId = 2
            case level3:
            levelId = 3
            case level4:
            levelId = 4
            default:
            levelId = nil
            }
            
            if levelId != nil {
            let level = Level(id: levelId, planet: currentPlanet)
            let scene = GameScene(size: self.size, level: level)
            let skView = self.view! as SKView
            let transition = SKTransition.fade(withDuration: 1.0)
            skView.ignoresSiblingOrder = false
            scene.size = skView.bounds.size
            scene.scaleMode = .aspectFill
            skView.presentScene(scene, transition: transition)
            }
            
            if self.nodes(at: location)[0] == self.back{
                let scene = PlanetsScene()
                let skView = self.view! as SKView
                let transition = SKTransition.fade(withDuration: 1.0)
                skView.ignoresSiblingOrder = false
                scene.size = skView.bounds.size
                scene.scaleMode = .aspectFill
                skView.presentScene(scene, transition: transition)
            }
            
            if self.nodes(at: location)[0] == self.moreInfo
            {
                addChild(textAboutPlanet)
                addChild(closeText)
            }
            
            if self.nodes(at: location)[0] == self.closeText
            {
                textAboutPlanet.removeFromParent()
                closeText.removeFromParent()
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
}
