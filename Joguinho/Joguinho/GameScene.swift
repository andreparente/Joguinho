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
    var background2 = Component(imageNamed: "background")
    var bigrock = Component(imageNamed: "rock1")
    var smallrock = Component(imageNamed: "rock2")
    override func didMove(to view: SKView) {
        spaceship = Spaceship(fuelLevel: 100)
        spaceship.physicsBody?.affectedByGravity = true
        spaceship.physicsBody?.linearDamping = 0.75
        spaceship.physicsBody?.isDynamic = true
        spaceship.physicsBody?.angularDamping = 0.75
        progressView.center = CGPoint(x: 300, y: 40)
        progressView.progress = 0.8
        progressView.progressTintColor = UIColor.black
        progressView.backgroundColor = UIColor.orange
        fuelDrops = SurvivalArtifact(type: Artifact(rawValue: "Fuel")!)
        background.anchorPoint = CGPoint(x: 0, y: 0)
        background.position = CGPoint(x: 0, y: 0)
        background.zPosition = 2
        
        self.background.size = CGSize(width: UIScreen.main.bounds.width + 1200, height: UIScreen.main.bounds.height)
        background2.anchorPoint = CGPoint(x: 0, y: 0)
        background2.position = CGPoint(x:background2.size.width - 1,y:0)
        self.spaceship.position = CGPoint(x: 50, y: 150)
        spaceship.zPosition = 10
        self.bigrock.position = CGPoint(x:400,y:200)
        bigrock.zPosition = 10
        self.fuelDrops.position = CGPoint(x:500,y:50)
        fuelDrops.zPosition = 10
        self.smallrock.position = CGPoint(x:200,y:80)
        smallrock.zPosition = 10
        self.addChild(background)
        self.addChild(background2)
        self.addChild(spaceship)
        self.addChild(bigrock)
        self.addChild(fuelDrops)
        self.addChild(smallrock)
        view.addSubview(progressView)
      
    }
    override func sceneDidLoad() {

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       let spaceshipMove = SKAction.moveBy(x: spaceship.position.x + 1, y: spaceship.position.y + 1, duration: 1)
        spaceship.run(spaceshipMove)
    }
    
    override func update(_ currentTime: TimeInterval) {
        background.position = CGPoint(x:background.position.x - 5,y:background.position.y)
        background2.position = CGPoint(x:background2.position.x - 5,y:background2.position.y)
        if background.position.x <= -background.size.width
        {
            background.position = CGPoint(x:background2.position.x + background2.size.width,y:background.position.y)
        }
        if background2.position.x < -background2.size.width
        {
            background2.position = CGPoint(x:background.position.x + background.size.width,y:background2.position.y)
        }
    }
    
}
