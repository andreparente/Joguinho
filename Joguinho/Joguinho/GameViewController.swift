//
//  GameViewController.swift
//  Joguinho
//
//  Created by Andre Machado Parente on 10/21/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
var levelId:Int = 1

//Por enquanto spaceship,astronaut e o array de items são todos nil porque não criamos a loja do jogo ainda.

var player = Player(coinsBalance: userDefaults.value(forKey: "coinsBalance") as! Int, lastLevel: userDefaults.value(forKey: "lastLevel") as! Int, spaceShip: nil, astronaut: nil, itens: nil)

class GameViewController: UIViewController {
    
    var scene:PlanetsScene!
    var menuScene: FirstScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        }
    override func viewWillLayoutSubviews() {
        
        
        super.viewWillLayoutSubviews()
        let skView = self.view as! SKView
        skView.ignoresSiblingOrder = false
        //Aqui vai ter que apresentar a first Scene e depois as outras scenes navegam entre si
        self.menuScene = FirstScene(size: skView.frame.size)
        self.scene = PlanetsScene(size: skView.frame.size)
     //   self.scene = GameScene(size: skView.bounds.size,level:level)
//        self.scene.scaleMode = .aspectFit
        skView.presentScene(menuScene)
        
    }
    override var shouldAutorotate: Bool {
        return true
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
