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

class StoreScene: SKScene {

    var buybutton = Spaceship(fuelLevel: 100,spaceShipName:SpaceShipName.standardSpaceShip)
    var list = [SKProduct]()
    var p = SKProduct()
    var numberOfGems = 0
    override func didMove(to view: SKView) {
      setupInitialScene()
        
        if(SKPaymentQueue.canMakePayments()) {
            print("IAP is enabled, loading")
            let productID:NSSet = NSSet(objects: "100_gems_pack")
            let request: SKProductsRequest = SKProductsRequest(productIdentifiers: productID as Set<NSObject> as! Set<String>)
            request.delegate = self
            request.start()
        } else {
            print("please enable IAPS")
        }
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches
        {
            let location = touch.location(in: self)
            switch self.nodes(at: location)[0] {
            case is Spaceship:
            for product in list {
                let prodID = product.productIdentifier
                if(prodID == "100_gems_pack") {
                    p = product
                    buyProduct() 
                    break;
                    }
                }
            default:
            break
            }
        }
    }
    
//MARK:Setup Functions
    
    func setupInitialScene () {
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        background.size = CGSize(width: 667 * size.width / 667, height: 375 * size.height / 375)
        addChild(background)
        
        
        buybutton.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        buybutton.size = CGSize(width: 100.52 * size.width / 667, height: 100 * size.height / 375)
        addChild(buybutton)
    }
    
    func buyProduct() {
        print("buy " + p.productIdentifier)
        let pay = SKPayment(product: p)
        SKPaymentQueue.default().add(self)
        SKPaymentQueue.default().add(pay as SKPayment)
    }
    
}


//MARK:Extensions to StoreScene


extension StoreScene:SKProductsRequestDelegate {
    
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


extension StoreScene:SKPaymentTransactionObserver {
    
    func paymentQueueRestoreCompletedTransactionsFinished(_ queue: SKPaymentQueue) {
        print("transactions restored")
        
        for transaction in queue.transactions {
            let t: SKPaymentTransaction = transaction
            
            let prodID = t.payment.productIdentifier as String
            
            switch prodID {
            case "100_gems_pack":
                print("Bought 100 gems")
            //Right here is where you should put the function that you want to execute when your in app purchase is complete
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
                case "100_gems_pack":
                    numberOfGems += 100
                    print(numberOfGems)
                //Here you should put the function you want to execute when the purchase is complete
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
