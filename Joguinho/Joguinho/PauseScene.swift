//
//  PauseScene.swift
//  Joguinho
//
//  Created by Felipe Viberti on 17/11/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import SpriteKit

class PauseScene: SKScene
{
    var currentSceneState:GameScene!
    let background = Component(imageNamed: "background")
    let resumeButton = Component(imageNamed: "rocket menu")
    let menuButtton = Component(imageNamed: "System")
    
    override func didMove(to view: SKView) {
    currentSceneState.isPaused = true
    background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
    background.size = CGSize(width:size.width, height:size.height)
    background.zPosition = 0
    resumeButton.position =  CGPoint(x: 5*screenSize.width/4 / 2, y: 1*screenSize.height/3)
    resumeButton.zPosition = 10
    menuButtton.position = CGPoint(x: 3*screenSize.width/4 / 2 , y: 1*screenSize.height/3)
    menuButtton.zPosition = 10
    addChild(background)
    addChild(resumeButton)
    addChild(menuButtton)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches
        {
            let location = touch.location(in: self)
            if self.nodes(at: location)[0] == self.resumeButton
            {
                let transition = SKTransition.fade(withDuration: 1.0)
                let scene1 = currentSceneState
                let skView = self.view! as SKView
                skView.ignoresSiblingOrder = false
                scene1!.size = skView.bounds.size
                scene1!.scaleMode = .aspectFill
                skView.presentScene(scene1!, transition: transition)
            }
        }

    }
}
