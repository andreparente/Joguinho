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
    override func didMove(to view: SKView)
    {
    semibackground.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
    semibackground.size = CGSize(width:size.width, height:size.height)
    semibackground.zPosition = 0
    background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
    background.zPosition = 10
    playAgainButton.position =  CGPoint(x: 5*screenSize.width/4 / 3, y: 1*screenSize.height/5)
    playAgainButton.zPosition = 10
    menuButtton.position = CGPoint(x: 6*screenSize.width/4 / 2 , y: 1*screenSize.height/5)
    menuButtton.zPosition = 10
    addChild(semibackground)
    addChild(background)
    addChild(playAgainButton)
    addChild(menuButtton)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches
        {
            let location = touch.location(in: self)
            if self.nodes(at: location)[0] == self.playAgainButton
            {
                let level = Level(id: levelId, planet: currentPlanet)
                let  scene = GameScene(size: self.size, level: level)
                let skView = self.view! as SKView
                skView.ignoresSiblingOrder = false
                scene.size = skView.bounds.size
                scene.scaleMode = .aspectFill
                skView.presentScene(scene)
            }
            else
            {
                if  self.nodes(at: location)[0] == self.menuButtton
                {
                    let transition = SKTransition.reveal(with: SKTransitionDirection.up, duration: 1.0)
                    let planet = Planet(name: PlanetName.Neptune, gravity: 1.15, type: PlanetType.gaseous) //Temporario.Tem que passar pra essa tela o planeta atual
                    let  scene = SelectedPlanetScene()
                    scene.selectedPlanetClass = planet
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
