//
//  SelectStoreScene.swift
//  Joguinho
//
//  Created by Felipe Viberti on 21/02/17.
//  Copyright © 2017 Andre Machado Parente. All rights reserved.
//

import UIKit
import SpriteKit

class SelectStoreScene: SKScene {

    var backButton:SKSpriteNode!
    var satellite:Component!
    var spaceship:Component!
    var satelliteText: SKLabelNode!
    var spaceshipText: SKLabelNode!
    
    override func didMove(to view: SKView) {
        setupInitalScene()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches
        {
            let location = touch.location(in: self)
            if backButton.contains(location) {
                let scene = PlanetsScene()
                let skView = self.view! as SKView
                skView.ignoresSiblingOrder = false
                scene.size = skView.bounds.size
                scene.scaleMode = .aspectFill
                skView.presentScene(scene, transition: transition)
            }
            if satellite.contains(location) {
                
                let scene = CoinStoreScene()
                let skView = self.view! as SKView
                skView.ignoresSiblingOrder = false
                scene.size = skView.bounds.size
                scene.scaleMode = .aspectFill
                skView.presentScene(scene, transition: transition)

            }
            
            if spaceship.contains(location) {
                let scene = InGameStoreScene()
                let skView = self.view! as SKView
                skView.ignoresSiblingOrder = false
                scene.size = skView.bounds.size
                scene.scaleMode = .aspectFill
                skView.presentScene(scene, transition: transition)

            }
        }
    }
    
    //MARK:Setup Functions
    func setupInitalScene () {
        
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        background.size = CGSize(width: 667 * size.width / 667, height: 375 * size.height / 375)
        addChild(background)
        
        backButton = createBackButton(size: self.size)
        addChild(backButton)
        
        satellite = Component(imageNamed: "satelite")
        satellite.position = CGPoint(x: 210 * size.width / 667, y: 200 * size.height / 375)
        addChild(satellite)
        
        
        satelliteText = SKLabelNode(fontNamed: "Futura")
        satelliteText.text = NSLocalizedString("Exchange",comment:"Exchange")
        satelliteText.fontSize = 20
        satelliteText.position = CGPoint(x: satellite.position.x , y:satellite.position.y - 80)
        satelliteText.zPosition = 10
        addChild(satelliteText)
        
        spaceshipText = SKLabelNode(fontNamed: "Futura")
        spaceshipText.text = NSLocalizedString("Spaceship",comment:"Exchange")
        spaceshipText.fontSize = 20
        spaceshipText.position = CGPoint(x: satelliteText.position.x + 200 , y:satelliteText.position.y)
        spaceshipText.zPosition = 10
        addChild(spaceshipText)

        spaceship = Component(imageNamed: "rocket fase")
        spaceship.position = CGPoint(x: spaceshipText.position.x, y: spaceshipText.position.y + 80)
        addChild(spaceship)
        
        
    }
}
