//
//  InGameStoreScene.swift
//  Joguinho
//
//  Created by Felipe Viberti on 20/02/17.
//  Copyright © 2017 Andre Machado Parente. All rights reserved.
//

import UIKit
import SpriteKit

class InGameStoreScene: SKScene {
    
    var platform:Component!
    var currentSpaceShipImage:Component!
    var backButton:SKSpriteNode!
    var chooseSpaceshipLabel:SKLabelNode!
    var currentlyinUse:SKLabelNode!
    var spaceshipOneImage:Spaceship!
    var spaceshipTwoImage:Spaceship!
    var spaceshipThreeImage:Spaceship!
    var spaceshipFourImage:Spaceship!
    
    override func didMove(to view: SKView) {
        setupInitialScene()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches
        {
            let location = touch.location(in: self)
            if backButton.contains(location) {
                
                let scene = SelectStoreScene(size:self.size)
                let skView = self.view! as SKView
                skView.ignoresSiblingOrder = false
                scene.size = skView.bounds.size
                scene.scaleMode = .aspectFill
                skView.presentScene(scene, transition: transition)
            }
        }
    }
    
    //MARK:Setup Functions
    func setupInitialScene() {
        
        //Ajeitar o tamanho da platform
        platform = Component(imageNamed: "platform")
        platform.position = CGPoint(x: 210 * size.width / 667, y: 200 * size.height / 375)
        addChild(platform)
        //Colocar a spaceship Vertical Aqui
        currentSpaceShipImage = Component(imageNamed: currentSpaceship.rawValue)
        
        backButton = createBackButton(size: self.size)
        addChild(backButton)
        
        
        chooseSpaceshipLabel = SKLabelNode(fontNamed: "Futura")
        chooseSpaceshipLabel.text = NSLocalizedString("Choose_Spaceship",comment:"Choose")
        addChild(chooseSpaceshipLabel)
        
        currentlyinUse = SKLabelNode(fontNamed: "Futura")
        currentlyinUse.text =  NSLocalizedString("Currently_In_Use",comment:"Currently")
        addChild(currentlyinUse)
    }
    
}
