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
    var fire:SKNode!
    var soundButton: SKSpriteNode!
    var buttonTexture: SKTexture!
    
    override func didMove(to view: SKView) {
        
        setupInitialScene()
        
    }
    
    //MARK:Setup Functions
    
    func setupInitialScene () {
        
        currentSceneState.isPaused = true
        isPlaying = false
        
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        background.size = CGSize(width:size.width, height:size.height)
        background.zPosition = 0
        addChild(background)
        
        
        resumeButton.position =  CGPoint(x: 6*screenSize.width/4 / 2, y: screenSize.height/2)
        resumeButton.zPosition = 10
        addChild(resumeButton)
        
        
        menuButtton.position = CGPoint(x: 2*screenSize.width/4 / 2 , y: screenSize.height/2)
        menuButtton.zPosition = 10
        addChild(menuButtton)
        
        
        resumeLabel.text = NSLocalizedString("RESUME",comment:"Resume")
        resumeLabel.fontSize = 20
        resumeLabel.position = CGPoint(x: resumeButton.position.x , y:resumeButton.position.y - 80)
        resumeLabel.zPosition = 10
        addChild(resumeLabel)
        
        
        menuLabel.text = "Menu"
        menuLabel.fontSize = 20
        menuLabel.position =  CGPoint(x: menuButtton.position.x , y:menuButtton.position.y - 85)
        menuLabel.zPosition = 10
        addChild(menuLabel)
        
        
        fire = SKSpriteNode(imageNamed: "fire rocket menu")
        fire.zPosition = 9
        fire.position = CGPoint(x: resumeButton.position.x - resumeButton.frame.width/1.9, y: resumeButton.position.y - resumeButton.frame.height/8)
        addChild(fire)


        currentSceneState.countDownLabel.text = "3"
        currentSceneState.timerDidEnd = false
        
        if userDefaults.bool(forKey: "soundOn") {
            buttonTexture = SKTexture(imageNamed: "soundOn")
            soundButton = SKSpriteNode(texture: buttonTexture)
            soundButton.position = CGPoint(x: 320 * size.width / 667, y: 50 * size.height / 375)
            soundButton.zPosition = 3
            self.addChild(soundButton)
        } else {
            buttonTexture = SKTexture(imageNamed: "soundOff")
            soundButton = SKSpriteNode(texture: buttonTexture)
            soundButton.position = CGPoint(x: 320 * size.width / 667, y: 50 * size.height / 375)
            soundButton.zPosition = 3
            self.addChild(soundButton)
        }

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if resumeButton.contains(location) {
                
                let scene1 = currentSceneState
                scene1?.isPaused = true
                let skView = self.view! as SKView
                skView.ignoresSiblingOrder = false
                scene1!.size = skView.bounds.size
                scene1!.scaleMode = .aspectFill
                skView.presentScene(scene1!, transition: transition)
            }
            else {
               if menuButtton.contains(location) {
                    let scene1 = PlanetsScene()
                    let skView = self.view! as SKView
                    skView.ignoresSiblingOrder = false
                    scene1.size = skView.bounds.size
                    scene1.scaleMode = .aspectFill
                    skView.presentScene(scene1, transition: transition)

                }
            else {
                if soundButton.contains(location) {
                    if userDefaults.bool(forKey: "soundOn") {
                        soundButton.texture = SKTexture(imageNamed:"soundOff")
                        userDefaults.set(false, forKey: "soundOn")
                        currentSceneState.backgroundSound.stop()
                      
                    } else {
                        soundButton.texture = SKTexture(imageNamed:"soundOn")
                        userDefaults.set(true, forKey: "soundOn")
                        currentSceneState.backgroundSound.play()
                    }
                }
            }
         }
      }
    }
}
