//
//  GameScene.swift
//  Joguinho
//
//  Created by Andre Machado Parente on 10/21/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var level: Level!
    var background = Component(imageNamed:"background")
    var progressBar = Component(imageNamed: "fuelbar")
    var insideProgressBar: FuelBar!
    var surface: Component!
    var surface2: Component!
    var spaceship: Spaceship!
    var astronaut: Astronaut!
    var rock1:Component = Component(imageNamed: "rock1")
    var realrocks:[Component] = [Component(imageNamed: "rock1")]
    var realgems:[Component] = [Component(imageNamed: "crystal")]
    var realFuelDrops:[SurvivalArtifact] = [SurvivalArtifact(type: Artifact(rawValue: "Fuel")!)]
    var realOxygenDrops:[SurvivalArtifact] = [SurvivalArtifact(type: Artifact(rawValue: "Oxygen")!)]
    var pauseButton = Component(imageNamed: "pause")
    

    var fuelDropname : [String] = []
    var gemName : [String] = []

   
    init(size: CGSize, level: Level) {
        super.init(size: size)
        
        self.level = level
        self.surface = Component(imageNamed: "\(level.planet.name.rawValue)Surface")
        self.surface2 = Component(imageNamed: "\(level.planet.name.rawValue)Surface")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        if !(background.parent == self) {
        physicsWorld.gravity = CGVector(dx: 0, dy: -level.planet.gravity)
        physicsWorld.contactDelegate = self
        
        setUpInicialScene()
        setUpPlayer()
        setUpFuelBar()
        spaceship.startMoment()
        setPauseButton()
        setUpRocks()
        setUpGems()
        if level.planet.type == PlanetType.gaseous {
            setUpFuelDrops()
        }
        else {
            setUpOxygenDrops()
        }
        }
        scene?.isPaused = false
        
    }
 

    func didBegin(_ contact: SKPhysicsContact) {
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        if firstBody.categoryBitMask == CollisionTypes.player.rawValue {
        switch secondBody.categoryBitMask {
        case CollisionTypes.fuelDrop.rawValue:
            let name1 = secondBody.node?.name
            let index = fuelDropname.index(of: name1!)
            
            if fuelDropname.contains(name1!) {
                secondBody.node?.removeFromParent()
                insideProgressBar.change(increase: 6)
                fuelDropname.remove(at: index!)
            }
            k+=1
        case  CollisionTypes.gem.rawValue:
            let name1 = secondBody.node?.name
            let index = gemName.index(of: name1!)
            if gemName.contains(name1!) {
                secondBody.node?.removeFromParent()
                userDefaults.set(userDefaults.value(forKey: "coinsBalance") as! Int + 1, forKey: "coinsBalance")
                player.coinsBalance = userDefaults.value(forKey: "coinsBalance") as! Int
                gemName.remove(at: index!)
            }
            k+=1
         case CollisionTypes.rock.rawValue:
            print("Bateu na pedra e morreu")
            actWhenDead()
            k+=1
        default:
        break
        }
    }
}
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !(scene?.isPaused)!
        {
            for touch in touches
            {
                let location = touch.location(in: self)
                if self.nodes(at: location)[0] == self.pauseButton
                {
                    scene?.isPaused = true
                    let  scene1 = PauseScene()
                    let skView = self.view! as SKView
                    let transition = SKTransition.fade(withDuration: 1.0)
                    scene1.currentSceneState = self
                    skView.ignoresSiblingOrder = false
                    scene1.size = skView.bounds.size
                    scene1.scaleMode = .aspectFill
                    skView.presentScene(scene1, transition: transition)

                } else {
                    
                    spaceship.spaceshipMovement()
                    
                    if insideProgressBar.spaceship.fuelLevel < 2 {
                        insideProgressBar.finish()
                    } else {
                        insideProgressBar.change(increase: -2)
                    }
                }
            }
        }
}

    override func update(_ currentTime: TimeInterval) {
        if !(scene?.isPaused)! {
            surface.position = CGPoint(x:surface.position.x - 5,y:surface.position.y)
            surface2.position = CGPoint(x:surface2.position.x - 5,y:surface2.position.y)
            
            if surface.position.x <= -surface.size.width {
                surface.position = CGPoint(x:surface2.position.x + surface2.size.width,y:surface.position.y)
            }
            if surface2.position.x <= -surface2.size.width {
                surface2.position = CGPoint(x:surface.position.x + surface.size.width,y:surface2.position.y)
            }
            
            setUpActionsForComponents()
            
        if isDead() {
                actWhenDead()
        }
        }
        if (spaceship.position.x > realgems[realgems.count-1].position.x && spaceship.position.y > realgems[realgems.count-1].position.y) || (spaceship.position.x > realrocks[realrocks.count - 1].position.x && spaceship.position.y > realrocks[realrocks.count - 1].position.y) {
            
             actWhenCompletedLevel()
        }
    }
    
    
//Funções auxiliares da classe
    
    func setUpInicialScene() {
        background.anchorPoint = CGPoint(x: 0, y: 0)
        background.position = CGPoint(x: 0, y: 0)
        background.zPosition = 1
        background.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        surface.position = CGPoint(x: 0, y: surface.size.height/3)
        surface.zPosition = 2
        surface.size = CGSize(width: UIScreen.main.bounds.width + 600, height: surface.size.height)
        
        surface2.position = CGPoint(x: surface.size.width, y: surface.size.height/3)
        surface2.zPosition = 2
        surface2.size = CGSize(width: UIScreen.main.bounds.width + 600, height: surface.size.height)
        
        addChild(background)
        addChild(surface)
        addChild(surface2)
        
    }
    
    
    func setUpFuelBar() {
        insideProgressBar = FuelBar(image: "fuel", spaceship: self.spaceship)
        progressBar.zPosition = 11
        progressBar.position = CGPoint(x: screenSize.width/2, y: 7*screenSize.height/8)
        insideProgressBar.zPosition = 12
        addChild(insideProgressBar)
        addChild(progressBar)
    }
    
    func setPauseButton() {
        pauseButton.position = CGPoint(x: 7.5*screenSize.width/8, y: 7*screenSize.height/8)
        pauseButton.zPosition = 4
        addChild(pauseButton)
        
    }
    
    func pressedPause() {
        if j == 0 {
            scene?.view?.isPaused = true
            j+=1
        }
        else {
            scene?.view?.isPaused = false
            j = 0
        }
    }
    
    func setUpRocks() {
        realrocks.removeAll()
        for i in 0...level.rocks.count - 1 {
            realrocks.append(Component(imageNamed: "rock1"))
            realrocks[i].name = "Rock\(i)"
            realrocks[i].position = level.rocks[i]
            realrocks[i].zPosition = 10
            realrocks[i].physicsBody = SKPhysicsBody(texture: realrocks[i].texture!,
                                                     size: CGSize(width: realrocks[i].size.width, height: realrocks[i].size.height))
            realrocks[i].physicsBody?.affectedByGravity = false
            realrocks[i].physicsBody?.categoryBitMask = CollisionTypes.rock.rawValue
            realrocks[i].physicsBody?.contactTestBitMask = CollisionTypes.player.rawValue | CollisionTypes.gem.rawValue | CollisionTypes.fuelDrop.rawValue
            realrocks[i].physicsBody?.collisionBitMask = CollisionTypes.player.rawValue
            
            self.addChild(realrocks[i])
        }
    }
    
    
    func setUpGems() {
        
        realgems.removeAll()
        for i in 0...level.gems.count - 1 {
            realgems.append(Component(imageNamed: "crystal"))
            realgems[i].name = "Gem\(i)"
            gemName.append(realgems[i].name!)
            realgems[i].position = level.gems[i]
            realgems[i].zPosition = 10
            realgems[i].physicsBody = SKPhysicsBody(texture: realgems[i].texture!,
                                                    size: CGSize(width: realgems[i].size.width, height: realgems[i].size.height))
            realgems[i].physicsBody?.affectedByGravity = false
            realgems[i].physicsBody?.categoryBitMask = CollisionTypes.gem.rawValue
            realgems[i].physicsBody?.contactTestBitMask = CollisionTypes.player.rawValue | CollisionTypes.rock.rawValue | CollisionTypes.fuelDrop.rawValue
            realgems[i].physicsBody?.collisionBitMask = 0
            
            
            self.addChild(realgems[i])
        }
        
    }
    
    
    func setUpFuelDrops() {
        
        realFuelDrops.removeAll()
        for i in 0...level.fueldrops.count - 1 {
            realFuelDrops.append(SurvivalArtifact(type: Artifact(rawValue: "Fuel")!))
            realFuelDrops[i].name = "FuelDrop\(i)"
            fuelDropname.append(realFuelDrops[i].name!)
            realFuelDrops[i].position = level.fueldrops[i]
            realFuelDrops[i].zPosition = 10
            realFuelDrops[i].physicsBody = SKPhysicsBody(texture: realFuelDrops[i].texture!,size: CGSize(width: realFuelDrops[i].size.width, height: realFuelDrops[i].size.height))
            realFuelDrops[i].physicsBody?.affectedByGravity = false
            realFuelDrops[i].physicsBody?.categoryBitMask = CollisionTypes.fuelDrop.rawValue
            realrocks[i].physicsBody?.contactTestBitMask = CollisionTypes.player.rawValue | CollisionTypes.rock.rawValue | CollisionTypes.gem.rawValue
            realrocks[i].physicsBody?.collisionBitMask = 0
            
            self.addChild(realFuelDrops[i])
        }
        
    }
    
    
    func setUpOxygenDrops() {
        realOxygenDrops.removeAll()
        for i in 0...level.oxygendrops.count - 1 {
            realOxygenDrops.append(SurvivalArtifact(type: Artifact(rawValue: "Oxygen")!))
            realrocks[i].name = "OxygenDrop\(i)"
            realOxygenDrops[i].position = level.oxygendrops[i]
            realOxygenDrops[i].zPosition = 10
            realOxygenDrops[i].physicsBody = SKPhysicsBody(texture: realOxygenDrops[i].texture!,size: CGSize(width: realOxygenDrops[i].size.width, height: realOxygenDrops[i].size.height))
            realOxygenDrops[i].physicsBody?.affectedByGravity = false
            realOxygenDrops[i].physicsBody?.categoryBitMask = CollisionTypes.oxygenDrop.rawValue
            realrocks[i].physicsBody?.contactTestBitMask = CollisionTypes.player.rawValue
            realrocks[i].physicsBody?.collisionBitMask = 0
            
            let oxygenMove = SKAction.applyForce(CGVector(dx: -20, dy: 0), duration: 2)
            realOxygenDrops[i].run(oxygenMove)
            self.addChild(realOxygenDrops[i])
        }
        
    }
    
    
    func setUpPlayer() {
        if level.planet.type == .gaseous {
            spaceship = Spaceship(fuelLevel: 350)
            addChild(spaceship)
        }
        else {
            astronaut = Astronaut(oxygenLevel: 100)
            addChild(astronaut)
        }
    }
    
    
    func setUpActionsForComponents() {
        for rock in realrocks {
            let rockMove3 = SKAction.applyForce(CGVector(dx: -0.1, dy: 0), duration: 0.5)
            rock.run(rockMove3)
        }
        for gem in realgems {
            let gemMove = SKAction.applyForce(CGVector(dx: -0.1, dy: 0), duration: 0.5)
            gem.run(gemMove)
        }
        for fuelDrop in realFuelDrops {
            let fuelMove = SKAction.applyForce(CGVector(dx: -0.1, dy: 0), duration: 0.5)
            fuelDrop.run(fuelMove)
        }

    }
    
    func isDead() -> Bool {
        if spaceship.position.y < 0 || spaceship.position.y > UIScreen.main.bounds.height {
            return true
        }
        if spaceship.fuelLevel <= 0 {
            return true
        }

         return false
    }
    
    
    func actWhenDead() {
        let transition = SKTransition.fade(withDuration: 1.0)
        let  scene = GameOverScene()
        let skView = self.view! as SKView
        skView.ignoresSiblingOrder = false
        scene.size = skView.bounds.size
        scene.scaleMode = .aspectFill
        skView.presentScene(scene, transition: transition)

    }
    
    
    func actWhenCompletedLevel() {
        let transition = SKTransition.fade(withDuration: 1.0)
        let  scene = LevelCompletedScene()
        scene.level = self.level.id
        let skView = self.view! as SKView
        skView.ignoresSiblingOrder = false
        scene.size = skView.bounds.size
        scene.scaleMode = .aspectFill
        skView.presentScene(scene, transition: transition)
    }
    
}
