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
            if spaceshipTwoImage.contains(location) {
                print(checkIfCanBuy(value: spaceshipTwoImage.price!,spaceshipNumber: 1))
                if checkIfCanBuy(value: spaceshipTwoImage.price!,spaceshipNumber: 1) == .ErrorNotEnoughMoney {
                    print("oi")
                    errorNotEnoughMoney()
                }
                    else {
                        print("naaaaaaaaaaaao")
                    }
                
              }
          }
    }
    
    //MARK:Setup Functions
    func setupInitialScene() {
        
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        background.size = CGSize(width: 667 * size.width / 667, height: 375 * size.height / 375)
        addChild(background)
        
        platform = Component(imageNamed: "platform")
        platform.position = CGPoint(x: 150 * size.width / 667, y: 100 * size.height / 375)
        addChild(platform)
        
        //Colocar a spaceship Vertical Aqui
        currentSpaceShipImage = Component(imageNamed: "spaceShipBtn")
        currentSpaceShipImage.position = CGPoint(x: 150 * size.width / 667, y: 150 * size.height / 375)
        addChild(currentSpaceShipImage)
        
        backButton = createBackButton(size: self.size)
        addChild(backButton)
        
        
        chooseSpaceshipLabel = SKLabelNode(fontNamed: "Futura")
        chooseSpaceshipLabel.fontSize = 25
        chooseSpaceshipLabel.text = NSLocalizedString("Choose_Spaceship",comment:"Choose")
        chooseSpaceshipLabel.position = CGPoint(x:screenSize.width/2, y: 4*screenSize.height/5)
        addChild(chooseSpaceshipLabel)
        
        currentlyinUse = SKLabelNode(fontNamed: "Futura")
        currentlyinUse.fontSize = 15
        currentlyinUse.text =  NSLocalizedString("Currently_In_Use",comment:"Currently")
        currentlyinUse.position = CGPoint(x: currentSpaceShipImage.position.x, y: currentSpaceShipImage.position.y - 100)
        addChild(currentlyinUse)
        
        spaceshipOneImage = Spaceship(fuelLevel: 1, spaceShipName: SpaceShipName.standardSpaceShip)
        spaceshipOneImage.position = CGPoint(x:screenSize.width/2, y: 3*screenSize.height/5)
        addChild(spaceshipOneImage)
        
        spaceshipTwoImage = Spaceship(fuelLevel: 1, spaceShipName: SpaceShipName.alienSpaceShip)
        spaceshipTwoImage.position = CGPoint(x: 1.7 * screenSize.width/2, y: 3*screenSize.height/5)
        addChild(spaceshipTwoImage)
    }
    
    func subtractCoins(value:Int) {
        userDefaults.set(userDefaults.value(forKey: "coinsBalance") as! Int - value, forKey: "coinsBalance")
        userDefaults.synchronize()
    }
    
    func checkIfCanBuy(value:Int,spaceshipNumber:Int) -> CheckBuy {
        if (userDefaults.value(forKey: "coinsBalance") as! Int) <= value  {
            print("entrou aqui")
            return .ErrorNotEnoughMoney
        }
        if spaceships[spaceshipNumber] {
            return .ErrorAlreadyBought
        }
        return .isOk
    }
    
    func errorNotEnoughMoney () {
        let alert=UIAlertController(title:"Sem dinheiro", message: "Jogue mais para ter mais dinheiro ou compre com seu dinheiro real please", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title:"Ok",style: UIAlertActionStyle.default,handler: nil))
        self.view?.window?.rootViewController?.present(alert,animated: true, completion: nil)
    }
}
