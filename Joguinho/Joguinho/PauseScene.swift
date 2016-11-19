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
    let resumeLabel:SKLabelNode = SKLabelNode(fontNamed: "Futura")
    let menuLabel:SKLabelNode = SKLabelNode(fontNamed: "Futura")
    
    override func didMove(to view: SKView) {
    currentSceneState.isPaused = true
    background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
    background.size = CGSize(width:size.width, height:size.height)
    background.zPosition = 0
    resumeButton.position =  CGPoint(x: 6*screenSize.width/4 / 2, y: screenSize.height/2)
    resumeButton.zPosition = 10
    menuButtton.position = CGPoint(x: 2*screenSize.width/4 / 2 , y: screenSize.height/2)
    menuButtton.zPosition = 10
    resumeLabel.text = "Resume"
    resumeLabel.fontSize = 20
    resumeLabel.position = CGPoint(x: resumeButton.position.x , y:resumeButton.position.y - 80)
    resumeLabel.zPosition = 10
    menuLabel.text = "Menu"
    menuLabel.fontSize = 20
    menuLabel.position =  CGPoint(x: menuButtton.position.x , y:menuButtton.position.y - 85)
    menuLabel.zPosition = 10
    addChild(menuLabel)
    addChild(resumeLabel)
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
                scene1?.isPaused = true
                let skView = self.view! as SKView
                skView.ignoresSiblingOrder = false
                scene1!.size = skView.bounds.size
                scene1!.scaleMode = .aspectFill
                skView.presentScene(scene1!, transition: transition)
            }
            else
            {
               if self.nodes(at: location)[0] == self.menuButtton
                {
                    let transition = SKTransition.fade(withDuration: 1.0)
                    let scene1 = PlanetsScene()
                    let skView = self.view! as SKView
                    skView.ignoresSiblingOrder = false
                    scene1.size = skView.bounds.size
                    scene1.scaleMode = .aspectFill
                    skView.presentScene(scene1, transition: transition)

                }
            }
        }

    }
}
