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
class GameViewController: UIViewController {
    
    var scene:GameScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        }
    override func viewWillLayoutSubviews() {
        
        let level = Level(id: levelId, planet: currentPlanet)
        //var skView:SKView = SKView()
        super.viewWillLayoutSubviews()
        let skView = self.view as! SKView
        skView.ignoresSiblingOrder = false
        self.scene = GameScene(size: skView.bounds.size,level:level)
        self.scene.scaleMode = .aspectFit
        skView.presentScene(scene)
       
        
    }
    override var shouldAutorotate: Bool {
        return true
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
