//
//  GameOverScene.swift
//  Joguinho
//
//  Created by Felipe Viberti on 17/11/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import SpriteKit

class GameOverScene: SKScene
{
    let semibackground = Component(imageNamed: "background")
    let background = Component(imageNamed: "gameOver")
    let playAgainButton = Component(imageNamed: "playAgain")
    let menuButtton = Component(imageNamed: "menu")
    
    override func didMove(to view: SKView) {
    self.view?.isUserInteractionEnabled = true
    semibackground.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
    semibackground.size = CGSize(width:size.width, height:size.height)
    semibackground.zPosition = 0
        
    background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
    background.zPosition = 10
        
    playAgainButton.position =  CGPoint(x: 4.3*screenSize.width/12, y: 1*screenSize.height/5)
    playAgainButton.zPosition = 10
        
    menuButtton.position = CGPoint(x: 5.3*screenSize.width/8 , y: 1*screenSize.height/5)
    menuButtton.zPosition = 10
        
    addChild(semibackground)
    addChild(background)
    addChild(playAgainButton)
    addChild(menuButtton)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if self.nodes(at: location)[0] == self.playAgainButton {
                let level = Level(id: levelId, planet: currentPlanet)
                let  scene = GameScene(size: self.size, level: level)
                let skView = self.view! as SKView
                skView.ignoresSiblingOrder = false
                scene.size = skView.bounds.size
                scene.scaleMode = .aspectFill
                skView.presentScene(scene)
            }
            else {
                if  self.nodes(at: location)[0] == self.menuButtton {
                    let transition = SKTransition.fade(withDuration: 1.0)
                    let  scene = PlanetsScene()
                    let skView = self.view! as SKView
                    skView.ignoresSiblingOrder = false
                    scene.size = skView.bounds.size
                    scene.scaleMode = .aspectFill
                    skView.presentScene(scene, transition: transition)
                   
                }
            }
        }
    }
}
