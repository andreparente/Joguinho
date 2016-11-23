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
    var level: Int!
    
    override func didMove(to view: SKView)
    {
        
        if !levelFound() {
            userDefaults.set(userDefaults.value(forKey: "lastLevel") as! Int + 1, forKey: "lastLevel")
            player.lastLevel = userDefaults.value(forKey: "lastLevel") as! Int!
            levels[currentPlanet.index.rawValue][userDefaults.value(forKey: "lastLevel") as! Int - 1 ] = String(userDefaults.value(forKey: "lastLevel") as! Int)
            userDefaults.set(levels, forKey: "levels")
            print(levels)
            print(userDefaults.value(forKey: "levels") as! [[String]])
        }
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
    
    
    func levelFound() -> Bool {
        
        for levelAux in levels[currentPlanet.index.rawValue] {
            if (levelAux == String(level + 1)) {
                return true
            }
        }
        return false
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
            if self.nodes(at: location)[0] == self.continueButton
            {
                //Esse if aqui é só pra não dar crash por enquanto que não tem level 3
                if levelId == 1
                {
                let level = Level(id: levelId + 1, planet: currentPlanet)
                let  scene = GameScene(size: self.size, level: level)
                let skView = self.view! as SKView
                skView.ignoresSiblingOrder = false
                scene.size = skView.bounds.size
                scene.scaleMode = .aspectFill
                skView.presentScene(scene)
                }
            }
        }
    }

}
