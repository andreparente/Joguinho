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
    var priceAlienSpaceship:SKLabelNode!
    var priceCarnivalSpaceship:SKLabelNode!
    var priceStarWarsSpaceship:SKLabelNode!
    var coin1:Component!
    var coin2:Component!
    var coin3:Component!
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
            
            if spaceshipOneImage.contains(location) {
                if currentSpaceship != SpaceShipName.standardSpaceShip {
                    currentSpaceShipImage.removeFromParent()
                    currentSpaceShipImage = Component(imageNamed: "spaceShipBtn")
                    placeCurrentSpaceship()
                    
                    currentSpaceship = SpaceShipName.standardSpaceShip
                    userDefaults.set(0, forKey: "currentSpaceship")
                }
            }
            if spaceshipTwoImage.contains(location) {
                buySpaceship(price: spaceshipTwoImage.price!, spaceshipNumber: 1, spaceshipName: spaceshipTwoImage.spaceShipName)
        }
            /* Descomentar quando fizer as outras naves
            if spaceshipThreeImage.contains(location) {
                  buySpaceship(price: spaceshipThreeImage.price!, spaceshipNumber: 2, spaceshipName: spaceshipThreeImage.spaceShipName)
            }
            if spaceshipFourImage.contains(location) {
                buySpaceship(price: spaceshipFourImage.price!, spaceshipNumber: 3, spaceshipName: spaceshipFourImage.spaceShipName)
            }
 */
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
        if currentSpaceship == SpaceShipName.standardSpaceShip {
        currentSpaceShipImage = Component(imageNamed: "spaceShipBtn")
        }
        else {
            currentSpaceShipImage = Component(imageNamed: currentSpaceship.rawValue)
        }
        placeCurrentSpaceship()
        
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
        currentlyinUse.position = CGPoint(x: currentSpaceShipImage.position.x, y: currentSpaceShipImage.position.y - (0.315 * screenSize.height))
        addChild(currentlyinUse)
        
        spaceshipOneImage = Spaceship(fuelLevel: 1, spaceShipName: SpaceShipName.standardSpaceShip)
        spaceshipOneImage.position = CGPoint(x:screenSize.width/2, y: 3*screenSize.height/5)
        addChild(spaceshipOneImage)
        
        spaceshipTwoImage = Spaceship(fuelLevel: 1, spaceShipName: SpaceShipName.alienSpaceShip)
        spaceshipTwoImage.position = CGPoint(x: 1.7 * screenSize.width/2, y: 3*screenSize.height/5)
        addChild(spaceshipTwoImage)
        
        if !spaceships[1] {
        priceAlienSpaceship = SKLabelNode(fontNamed: "Futura")
        priceAlienSpaceship.fontSize = 15
        priceAlienSpaceship.text = "\(spaceshipTwoImage.price!)"
        priceAlienSpaceship.position = CGPoint(x: spaceshipTwoImage.position.x, y: spaceshipTwoImage.position.y - 0.1875*screenSize.height)
        addChild(priceAlienSpaceship)
        
        coin1 = Component(imageNamed: "coin")
        coin1.position = CGPoint(x: priceAlienSpaceship.position.x + screenSize.width/22, y: priceAlienSpaceship.position.y + screenSize.height/40)
        coin1.size = CGSize(width: coin1.size.width/8, height: coin1.size.height/8)
        addChild(coin1)
            
        }
        /* Descomentar isso aqui quando tiver adicionado as outras spaceships
         
        if !spaceships[2] {
            priceCarnivalSpaceship = SKLabelNode(fontNamed: "Futura")
            priceCarnivalSpaceship.fontSize = 15
            priceCarnivalSpaceship.text = "\(spaceshipTwoImage.price!)"
            
            //Alterar a position aqui quando tiver as imagens
            priceCarnivalSpaceship.position = CGPoint(x: spaceshipThreeImage.position.x, y: spaceshipThreeImage.position.y - 0.1875*screenSize.height)
            addChild(priceCarnivalSpaceship)
            
            coin2 = Component(imageNamed: "coin")
            coin2.position = CGPoint(x: priceCarnivalSpaceship.position.x + screenSize.width/22, y: priceCarnivalSpaceship.position.y + screenSize.height/40)
            coin2.size = CGSize(width: coin1.size.width/8, height: coin1.size.height/8)
            addChild(coin2)
        }

        if !spaceships[3] {
            priceStarWarsSpaceship = SKLabelNode(fontNamed: "Futura")
            priceStarWarsSpaceship.fontSize = 15
            priceStarWarsSpaceship.text = "\(spaceshipTwoImage.price!)"
            
            //Alterar a position aqui quando tiver as imagens
            priceStarWarsSpaceship.position = CGPoint(x: spaceshipFourImage.position.x, y: spaceshipFourImage.position.y - 0.1875*screenSize.height)
            addChild(priceStarWarsSpaceship)
            
            coin3 = Component(imageNamed: "coin")
            coin3.position = CGPoint(x: priceStarWarsSpaceship.position.x + screenSize.width/22, y: priceStarWarsSpaceship.position.y + screenSize.height/40)
            coin3.size = CGSize(width: coin1.size.width/8, height: coin1.size.height/8)
            addChild(coin3)
        }
 */

    }
    
    func placeCurrentSpaceship () {
        currentSpaceShipImage.position = CGPoint(x: 150 * size.width / 667, y: 150 * size.height / 375)
        addChild(currentSpaceShipImage)

    }
    
    //MARK:Buying Functions
    func subtractCoins(value:Int) {
        userDefaults.set(userDefaults.value(forKey: "coinsBalance") as! Int - value, forKey: "coinsBalance")
        userDefaults.synchronize()
    }
    
    func checkIfCanBuy(value:Int,spaceshipNumber:Int) -> CheckBuy {
        if spaceships[spaceshipNumber] {
            return .ErrorAlreadyBought
        }
        if (userDefaults.value(forKey: "coinsBalance") as! Int) < value  {
            print("entrou aqui")
            return .ErrorNotEnoughMoney
        }
        print(spaceships)
        
        return .isOk
    }
    
    func buySpaceship (price:Int,spaceshipNumber:Int,spaceshipName:SpaceShipName) {
        let result = checkIfCanBuy(value: price,spaceshipNumber: spaceshipNumber)
        if result == .ErrorNotEnoughMoney {
            errorNotEnoughMoney()
        }
        else {
            if result == .ErrorAlreadyBought {
                currentSpaceShipImage.removeFromParent()
                currentSpaceShipImage = Component(imageNamed:spaceshipName.rawValue)
                placeCurrentSpaceship()
                currentSpaceship = spaceshipName
                userDefaults.set(spaceshipNumber, forKey: "currentSpaceship")
            }
            else {
                confirmBuy(value:price,spaceshipNumber:spaceshipNumber,spaceShipName:spaceshipName)
            }
        }

        
    }
    func errorNotEnoughMoney () {
        let alert=UIAlertController(title:NSLocalizedString("Not_Enough_Money_Title", comment: "title"), message: NSLocalizedString("Not_Enough_Money_Description", comment: "desc"), preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title:"Ok",style: UIAlertActionStyle.default,handler: nil))
        self.view?.window?.rootViewController?.present(alert,animated: true, completion: nil)
        
    }
    
    func confirmBuy(value:Int,spaceshipNumber:Int,spaceShipName:SpaceShipName) {
        
        let alert=UIAlertController(title:NSLocalizedString("Confirm_Purchase_Title", comment: "confirm"), message: NSLocalizedString("Confirm_Purchase_Description", comment: "confirm") + " " + String(value) + " " + NSLocalizedString("Coins", comment: "Coins"), preferredStyle: UIAlertControllerStyle.alert)
        
      alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (alert: UIAlertAction!) in
        self.actWhenBought(value: value,spaceshipNumber:spaceshipNumber,spaceshipName: spaceShipName)
      }))
         alert.addAction(UIAlertAction(title:"Cancel",style: UIAlertActionStyle.cancel,handler: nil))
        self.view?.window?.rootViewController?.present(alert,animated: true, completion: nil)

    }
    
    func actWhenBought (value:Int,spaceshipNumber:Int,spaceshipName:SpaceShipName) {
        subtractCoins(value: value)
        userDefaults.set(spaceshipNumber, forKey: "currentSpaceship")
        spaceships[spaceshipNumber] = true
        userDefaults.set(spaceships, forKey: "spaceships")
        currentSpaceShipImage.removeFromParent()
        currentSpaceShipImage = Component(imageNamed: spaceshipName.rawValue)
        placeCurrentSpaceship()
        currentSpaceship = spaceshipName

    }
}
