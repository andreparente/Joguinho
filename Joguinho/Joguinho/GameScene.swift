//
//  GameScene.swift
//  Joguinho
//
//  Created by Andre Machado Parente on 10/21/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var spaceship:Spaceship!
    var fuelDrops:SurvivalArtifact!
    let progressView = UIProgressView(progressViewStyle: UIProgressViewStyle.bar)
    var background = Component(imageNamed:"background")
    var bigrock = Component(imageNamed: "rock1")
    var smallrock = Component(imageNamed: "rock2")
    override func didMove(to view: SKView) {
        spaceship = Spaceship(fuelLevel: 100)
        progressView.center = CGPoint(x: 300, y: 40)
        progressView.progress = 0.8
        progressView.progressTintColor = UIColor.black
        progressView.backgroundColor = UIColor.orange
        fuelDrops = SurvivalArtifact(type: Artifact(rawValue: "Fuel")!)
        self.background.size = CGSize(width: UIScreen.main.bounds.width + 600, height: UIScreen.main.bounds.height + 600)
        self.spaceship.position = CGPoint(x: 50, y: 150)
        self.bigrock.position = CGPoint(x:400,y:200)
        self.fuelDrops.position = CGPoint(x:500,y:50)
        self.smallrock.position = CGPoint(x:200,y:80)
        self.addChild(background)
        self.addChild(spaceship)
        self.addChild(bigrock)
        self.addChild(fuelDrops)
        self.addChild(smallrock)
        view.addSubview(progressView)
      
    }
    override func sceneDidLoad() {

    }
    
}
