//
//  StoreScene.swift
//  Joguinho
//
//  Created by Felipe Viberti on 07/02/17.
//  Copyright © 2017 Andre Machado Parente. All rights reserved.
//

import UIKit
import SpriteKit
import StoreKit

class CoinStoreScene: SKScene {

    var list = [SKProduct]()
    var p = SKProduct()
    var numberOfGems = 0
    var backButton:SKSpriteNode!
    var firstPack:Component!
    var secondPack:Component!
    var thirdPack:Component!
    var request: SKProductsRequest!
    var chooseLabel:SKLabelNode!
    var firstPrice:SKLabelNode!
    var secondPrice:SKLabelNode!
    var thirdPrice:SKLabelNode!
    var firstQtdCoins:SKLabelNode!
    var secondQtdCoins:SKLabelNode!
    var thirdQtdCoins:SKLabelNode!
    
    override func didMove(to view: SKView) {
    setupInitialScene()
     enablePayments()

}
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches
        {
            let location = touch.location(in: self)
            
            if backButton.contains(location) {
                request.cancel()
                let scene = SelectStoreScene(size:self.size)
                let skView = self.view! as SKView
                skView.ignoresSiblingOrder = false
                scene.size = skView.bounds.size
                scene.scaleMode = .aspectFill
                skView.presentScene(scene, transition: transition)
            }
            if firstPack.contains(location) {
                
            if Reachability.isConnectedToNetwork() {
                
            for product in list {
                let prodID = product.productIdentifier
                if(prodID == "10_coins_pack") {
                    p = product
                    buyProduct()
                    }
                }
            }
            else {
                errorNoInternet()
                }
        }
            if secondPack.contains(location) {
                
            if Reachability.isConnectedToNetwork() {
                
                for product in list {
                    let prodID = product.productIdentifier
                    if(prodID == "100_coins_pack") {
                        p = product
                        buyProduct()
                    }
                }
            }
            else {
                 errorNoInternet()
                 }
            }
            if thirdPack.contains(location) {
                if Reachability.isConnectedToNetwork() {
                    
                    for product in list {
                        let prodID = product.productIdentifier
                        if(prodID == "600_coins_pack") {
                            p = product
                            buyProduct()
                        }
                    }
                }
                else {
                    errorNoInternet()
                }
            }
        }
}
    
//MARK:- Setup Functions
    
    func setupInitialScene () {
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        background.size = CGSize(width: 667 * size.width / 667, height: 375 * size.height / 375)
        addChild(background)
        
        firstPack = Component(imageNamed: "10coins_pack")
        firstPack.position = CGPoint(x:100 * size.width / 667, y: 140 * size.height / 375)
        firstPack.size = CGSize(width: firstPack.size.width/4, height: firstPack.size.height/4)
        addChild(firstPack)
        
        secondPack = Component(imageNamed: "100coins_pack")
        secondPack.position = CGPoint(x: 270 * size.width/667, y: 180 * size.height / 375)
        secondPack.size = CGSize(width: secondPack.size.width/4, height: secondPack.size.height/4)
        addChild(secondPack)
        
        thirdPack = Component(imageNamed: "600coins_pack")
        thirdPack.position = CGPoint(x: 500 * size.width/667, y: 180 * size.height / 375)
        thirdPack.size = CGSize(width: thirdPack.size.width/5, height: thirdPack.size.height/5)
        addChild(thirdPack)
        
        chooseLabel = SKLabelNode(fontNamed: "Futura")
        chooseLabel.fontSize = 25
        chooseLabel.text = NSLocalizedString("Choose_Your_Pack",comment:"Choose")
        chooseLabel.position = CGPoint(x:screenSize.width/2, y: 4*screenSize.height/5)
        addChild(chooseLabel)
        
        firstQtdCoins = SKLabelNode(fontNamed: "Futura")
        firstQtdCoins.fontSize = 15
        firstQtdCoins.text = "10" + " " + NSLocalizedString("Coins", comment: "Coins")
        firstQtdCoins.fontColor = UIColor.white
        firstQtdCoins.position = CGPoint(x: firstPack.position.x, y: firstPack.position.y - 0.1875*screenSize.height)
        addChild(firstQtdCoins)
        
        firstPrice = SKLabelNode(fontNamed: "Futura")
        firstPrice.fontSize = 15
        firstPrice.text = "$0,99"
        firstPrice.fontColor = UIColor.yellow
        firstPrice.position = CGPoint(x: firstQtdCoins.position.x, y: firstQtdCoins.position.y - 0.05*screenSize.height)
        addChild(firstPrice)
        
        
        secondQtdCoins = SKLabelNode(fontNamed: "Futura")
        secondQtdCoins.fontSize = 15
        secondQtdCoins.text = "100" + " " + NSLocalizedString("Coins", comment: "Coins")
        secondQtdCoins.fontColor = UIColor.white
        secondQtdCoins.position = CGPoint(x: secondPack.position.x, y: secondPack.position.y - 0.3*screenSize.height)
        addChild(secondQtdCoins)
        
        secondPrice = SKLabelNode(fontNamed: "Futura")
        secondPrice.fontSize = 15
        secondPrice.text = "$4,99"
        secondPrice.fontColor = UIColor.yellow
        secondPrice.position = CGPoint(x: secondQtdCoins.position.x, y: secondQtdCoins.position.y - 0.05*screenSize.height)
        addChild(secondPrice)
        
        thirdQtdCoins = SKLabelNode(fontNamed: "Futura")
        thirdQtdCoins.fontSize = 15
        thirdQtdCoins.text = "600" + " " + NSLocalizedString("Coins", comment: "Coins")
        thirdQtdCoins.fontColor = UIColor.white
        thirdQtdCoins.position = CGPoint(x: thirdPack.position.x, y: thirdPack.position.y - 0.3*screenSize.height)
        addChild(thirdQtdCoins)
        
        thirdPrice = SKLabelNode(fontNamed: "Futura")
        thirdPrice.fontSize = 15
        thirdPrice.text = "$9,99"
        thirdPrice.fontColor = UIColor.yellow
        thirdPrice.position = CGPoint(x: thirdQtdCoins.position.x, y: thirdQtdCoins.position.y - 0.05*screenSize.height)
        addChild(thirdPrice)
        
        backButton = createBackButton(size:self.size)
        addChild(backButton)
    }
    
    func buyProduct() {
        print("buy " + p.productIdentifier)
        let pay = SKPayment(product: p)
        SKPaymentQueue.default().add(self)
        SKPaymentQueue.default().add(pay as SKPayment)
    }
    
    func enablePayments() {
        
        if(SKPaymentQueue.canMakePayments()) {
            print("IAP is enabled, loading")
            let productID:NSSet = NSSet(objects: "10_coins_pack","100_coins_pack","600_coins_pack")
            print(productID)
             request = SKProductsRequest(productIdentifiers: productID  as! Set<String>)
            request.delegate = self
            request.start()
        } else {
            print("please enable IAPS")
        }
    }
    
    func addCoins(value:Int) {
        userDefaults.set(userDefaults.value(forKey: "coinsBalance") as! Int + value, forKey: "coinsBalance")
    }
    func errorNoInternet() {
        let alert=UIAlertController(title:NSLocalizedString("No_Internet_Title", comment: "title"), message: NSLocalizedString("No_Internet_Description", comment: "desc"), preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title:"Ok",style: UIAlertActionStyle.default,handler: nil))
        self.view?.window?.rootViewController?.present(alert,animated: true, completion: nil)
    }
}


//MARK:- Extensions to StoreScene

extension CoinStoreScene:SKProductsRequestDelegate {
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        print("product request")
        let myProduct = response.products
        
        for product in myProduct {
            print("product added")
            print(product.productIdentifier)
            print(product.localizedTitle)
            print(product.localizedDescription)
            print(product.price)
            
            list.append(product)
        }
    }
}


extension CoinStoreScene:SKPaymentTransactionObserver {
    
    func paymentQueueRestoreCompletedTransactionsFinished(_ queue: SKPaymentQueue) {
        print("transactions restored")
        
        for transaction in queue.transactions {
            let t: SKPaymentTransaction = transaction
            
            let prodID = t.payment.productIdentifier as String
            
            switch prodID {
            case "10_coins_pack":
                print("Bought 10 coins")
            addCoins(value: 10)
            case "100_coins_pack":
                addCoins(value: 100)
            case "600_coins_pack":
                addCoins(value: 600)
            default:
                print("IAP not setup")
            }
            
        }
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        print("Received payment transaction response from Apple")
        
        for transaction:AnyObject in transactions {
            let trans = transaction as! SKPaymentTransaction
            switch trans.transactionState {
                
            case .purchased, .restored:
                print("buy, ok unlock iap here")
                print(p.productIdentifier)
                
                let prodID = p.productIdentifier as String
                switch prodID {
                case "10_coins_pack":
                    addCoins(value: 10)
                case "100_coins_pack":
                    addCoins(value: 100)
                case "600_coins_pack":
                    addCoins(value: 600)
                default:
                    print("IAP not setup")
                }
                
                queue.finishTransaction(trans)
                break;
            case .failed:
                print("buy error")
                queue.finishTransaction(trans)
                break;
            default:
                print("default")
                break;
                
            }
        }
    }
    
    func finishTransaction(trans:SKPaymentTransaction) {
        
        print("finished transactions")
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, removedTransactions transactions: [SKPaymentTransaction]) {
        print("removed Transactions")
    }
}
