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
    var lostLabel: SKLabelNode!
    var lostMessage: SKLabelNode!
    
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
        
    lostLabel = SKLabelNode(fontNamed: "Futura-Bold")
    lostLabel.text = NSLocalizedString("You_Lost", comment: "YOU LOST :(")
    lostLabel.fontSize = 25/568 * screenSize.width
    lostLabel.fontColor = UIColor(red:0.82, green:0.01, blue:0.11, alpha:1.0)
    lostLabel.position = CGPoint(x: screenSize.width/2, y: background.position.y + 3*lostLabel.frame.height)
    lostLabel.zPosition = 20
    addChild(lostLabel)
        
    lostMessage = SKLabelNode(fontNamed: "Futura")
    lostMessage.text = NSLocalizedString("Lost_Message", comment: "no prob, you can try again")
    lostMessage.fontSize = 18/568 * screenSize.width
    lostMessage.fontColor = UIColor(red:0.09, green:0.01, blue:0.27, alpha:1.0)
    lostMessage.position = CGPoint(x: lostLabel.position.x, y: lostLabel.position.y - lostMessage.frame.height/2 - 15)
    lostMessage.zPosition = 20
    addChild(lostMessage)
        
    addChild(semibackground)
    addChild(background)
    addChild(playAgainButton)
    addChild(menuButtton)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let transition = SKTransition.fade(withDuration: 1.0)
            if self.nodes(at: location)[0] == self.playAgainButton {
                let level = Level(id: levelId, planet: currentPlanet)
                let  scene = GameScene(size: self.size, level: level)
                let skView = self.view! as SKView
                skView.ignoresSiblingOrder = false
                scene.size = skView.bounds.size
                scene.scaleMode = .aspectFill
                skView.presentScene(scene, transition: transition)

            }
            else {
                if  self.nodes(at: location)[0] == self.menuButtton {
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
