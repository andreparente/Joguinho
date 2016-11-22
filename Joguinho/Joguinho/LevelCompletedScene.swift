//
//  LevelCompletedScene.swift
//  Joguinho
//
//  Created by Felipe Viberti on 17/11/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import SpriteKit
class LevelCompletedScene: SKScene
{
    let semibackground = Component(imageNamed: "background")
    let background = Component(imageNamed: "gameWin")
    let continueButton = Component(imageNamed: "continue")
    let retry = Component(imageNamed: "retry")
    
    override func didMove(to view: SKView)
    {
        userDefaults.set(userDefaults.value(forKey: "lastLevel") as! Int + 1, forKey: "lastLevel")
        semibackground.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        semibackground.size = CGSize(width:size.width, height:size.height)
        semibackground.zPosition = 0
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        background.zPosition = 10
        continueButton.position =  CGPoint(x: 5*screenSize.width/4 / 3, y: 1*screenSize.height/5)
        continueButton.zPosition = 10
        retry.position = CGPoint(x: 6*screenSize.width/4 / 2 , y: 1*screenSize.height/5)
        retry.zPosition = 10
        addChild(semibackground)
        addChild(background)
        addChild(continueButton)
        addChild(retry)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches
        {
            let location = touch.location(in: self)
            if self.nodes(at: location)[0] == self.retry
            {
                let level = Level(id: levelId, planet: currentPlanet)
                let  scene = GameScene(size: self.size, level: level)
                let skView = self.view! as SKView
                skView.ignoresSiblingOrder = false
                scene.size = skView.bounds.size
                scene.scaleMode = .aspectFill
                skView.presentScene(scene)
            }
          //Tem que colocar o continue to next Level
        }
    }

}
