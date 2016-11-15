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
    
    var scene:GameScene!
    var levelId:Int!
    var planetName:PlanetName!
    override func viewDidLoad() {
        super.viewDidLoad()
        }
    override func viewWillLayoutSubviews() {
        //O id e o planeta tem que vir do segue
        var level = Level(id: 1, planet: Planet(name: PlanetName.Neptune, gravity: 1.115, type: PlanetType.gaseous))
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
