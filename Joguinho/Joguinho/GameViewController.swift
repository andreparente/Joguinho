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
    //    self.scene = PlanetsScene(size: skView.frame.size)
          self.menuScene = FirstScene(size: skView.frame.size)
        skView.presentScene(menuScene)
     //  skView.presentScene(scene)
        
    }
    override var shouldAutorotate: Bool {
        return true
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
