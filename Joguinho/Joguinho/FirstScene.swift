//
//  FirstScene.swift
//  Joguinho
//
//  Created by Felipe Viberti on 16/11/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import SpriteKit

class FirstScene: SKScene {
    
    var background: SKSpriteNode!
    var startButton: SKNode!
    var shoppingButton: SKNode!
    var title: SKNode!
    var shoppingLabel: SKLabelNode!
    var startLabel: SKLabelNode!
    var fire:SKNode!
    
    override func didMove(to view: SKView) {
        
       setupInitialScene()

    }
    
    
    //MARK:Setup Functions
    
    func setupInitialScene() {
        
        background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        background.size = CGSize(width: 667 * size.width / 667, height: 375 * size.height / 375)
        self.addChild(background)
        
        title = SKSpriteNode(imageNamed: "spaceTrip")
        title.position = CGPoint(x: screenSize.width/2, y:4*screenSize.height/5)
        self.addChild(title)
        
        shoppingButton = SKSpriteNode(imageNamed: "satelite")
        shoppingButton.position = CGPoint(x: 1*screenSize.width/4 , y:screenSize.height/2)
        self.addChild(shoppingButton)
        
        shoppingLabel = SKLabelNode(fontNamed: "Futura")
        shoppingLabel.text = "Shopping time!"
        shoppingLabel.fontSize = 20
        shoppingLabel.position = CGPoint(x: shoppingButton.position.x , y:shoppingButton.position.y - 80)
        self.addChild(shoppingLabel)
        
        startButton = SKSpriteNode(imageNamed: "rocket menu")
        startButton.position = CGPoint(x: 3*screenSize.width/4, y: screenSize.height/2)
        startButton.zPosition = 2
        self.addChild(startButton)
        
        fire = SKSpriteNode(imageNamed: "fire rocket menu")
        fire.position = CGPoint(x: startButton.position.x - startButton.frame.width/1.9, y: startButton.position.y - startButton.frame.height/8)
        self.addChild(fire)
        
        startLabel = SKLabelNode(fontNamed: "Futura")
        startLabel.text = "Travel!"
        startLabel.fontSize = 20
        startLabel.position = CGPoint(x: startButton.position.x , y:startButton.position.y - 80)
        self.addChild(startLabel)

    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            // Get the location of the touch in this scene
            let location = (touch as AnyObject).location(in: self)
            // Check if the location of the touch is within the button's bounds
            let transition = SKTransition.fade(withDuration: 1.0)
            if startButton.contains(location) {
             
                let nextScene = PlanetsScene(size: self.size)
                nextScene.scaleMode = SKSceneScaleMode.aspectFill
                self.scene?.view?.presentScene(nextScene, transition: transition)
                
            } else if shoppingButton.contains(location) {
              let nextScene = StoreScene()
              self.scene?.view?.presentScene(nextScene, transition: transition)
            }
        }
    }
}
