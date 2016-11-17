//
//  GameScene.swift
//  Joguinho
//
//  Created by Andre Machado Parente on 10/21/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import SpriteKit
import GameplayKit
var j = 0
var k = 0

enum CollisionTypes: UInt32 {
    case player = 1
    case rock = 2
    case fuelDrop = 4
    case oxygenDrop = 8
    case gem = 16
}

var currentPlanet:Planet = Planet(name: PlanetName.Neptune, gravity: 1.115, type: PlanetType.gaseous)

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var screenSize = UIScreen.main.bounds
    var level: Level!
    var background = Component(imageNamed:"background")
    var progressBar = Component(imageNamed: "fuelbar")
    var insideProgressBar = FuelBar(image: "fuel")
    var surface: Component!
    var surface2: Component!
    var spaceship: Spaceship!
    var astronaut: Astronaut!
    let progressView = UIProgressView(progressViewStyle: UIProgressViewStyle.bar)
    var rock1:Component = Component(imageNamed: "rock1")
    var realrocks:[Component] = [Component(imageNamed: "rock1")]
    var realgems:[Component] = [Component(imageNamed: "crystal")]
    var realFuelDrops:[SurvivalArtifact] = [SurvivalArtifact(type: Artifact(rawValue: "Fuel")!)]
    var realOxygenDrops:[SurvivalArtifact] = [SurvivalArtifact(type: Artifact(rawValue: "Oxygen")!)]
    var counter: CGFloat! = 0
    
    var numberOfGems:Int = 0
    var qtdFuel = UILabel(frame: CGRect(x: 250, y: 200, width: 200, height: 21))
    var fuelDropname : [String] = []
    var gemName : [String] = []
    var pauseButton = UIButton()
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
        
        physicsWorld.gravity = CGVector(dx: 0, dy: -level.planet.gravity)
        physicsWorld.contactDelegate = self
        setUpInicialScene()
        setUpPlayer()
        setUpFuelBar()
        spaceship.startMoment()
        setPauseButton()
        setUpRocks()
        setUpGems()
        if level.planet.type == PlanetType.gaseous
        {
            setUpFuelDrops()
        }
        else
        {
            setUpOxygenDrops()
        }
        qtdFuel.center = CGPoint(x:160, y:284)
        qtdFuel.textAlignment = NSTextAlignment.center
        qtdFuel.text = String(spaceship.fuelLevel)
       // view.addSubview(qtdFuel)
        //  progressView.center = CGPoint(x: 300, y: 40)
        //   progressView.setProgress(10, animated: true)
        //  progressView.progressTintColor = UIColor.white
        //  progressView.backgroundColor = UIColor.orange
        
        //  view.addSubview(progressView)
        
    }
    override func sceneDidLoad() {
        
    }
    func setUpFuelBar()
    {
        progressBar.zPosition = 2
        progressBar.position = CGPoint(x: screenSize.width/2, y: 7*screenSize.height/8)
        insideProgressBar.zPosition = 3
        insideProgressBar.qtd = 100
        //insideProgressBar.position = CGPoint(x: screenSize.width/2-60, y: 7*screenSize.height/8)
        addChild(insideProgressBar)
        addChild(progressBar)
    }
    func setPauseButton()
    {
        pauseButton.setImage(UIImage(named: "pause"), for: .normal)
        pauseButton.frame = CGRect(x: 7*screenSize.width/8, y: 7*screenSize.height/8, width: 50, height: 50)
        
        pauseButton.addTarget(self, action: #selector(pressedPause), for: .touchUpInside)
       // view?.addSubview(pauseButton)
    }
    func pressedPause()
    {
        if j == 0
        {
            scene?.view?.isPaused = true
            j+=1
        }
        else
        {
            scene?.view?.isPaused = false
            j = 0
        }
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
        
        if firstBody.categoryBitMask == CollisionTypes.player.rawValue && secondBody.categoryBitMask == CollisionTypes.fuelDrop.rawValue
        {
            let name1 = secondBody.node?.name
            let index = fuelDropname.index(of: name1!)
            
            if fuelDropname.contains(name1!)
            {
                secondBody.node?.removeFromParent()
                spaceship.increaseFuelLevel()
                if counter >= 3 {
                    counter = counter - 3
                } else {
                    counter = 0
                }
                insideProgressBar.change(increase: 6)
                //insideProgressBar.qtd = insideProgressBar.qtd! + 3
                qtdFuel.text = String(spaceship.fuelLevel)
                fuelDropname.remove(at: index!)
            }
        }
        else
        {
            if firstBody.categoryBitMask == CollisionTypes.player.rawValue && secondBody.categoryBitMask == CollisionTypes.gem.rawValue
            {
                let name1 = secondBody.node?.name
                let index = gemName.index(of: name1!)
                if gemName.contains(name1!)
                {
                    secondBody.node?.removeFromParent()
                    numberOfGems += 1
                    print(numberOfGems)
                    gemName.remove(at: index!)
                }
            }
            else
            {
                if firstBody.categoryBitMask == CollisionTypes.player.rawValue && secondBody.categoryBitMask == CollisionTypes.rock.rawValue
                {
                    print("Bateu na pedra e morreu")
                    let  scene = GameOverScene()
                    let skView = self.view! as SKView
                    skView.ignoresSiblingOrder = false
                    scene.size = skView.bounds.size
                    scene.scaleMode = .aspectFill
                    skView.presentScene(scene)
                }
                
            }
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !(scene?.isPaused)!
        {
            spaceship.spaceshipMovement()
            // progressView.setProgress(progressView.progress - 1, animated: true)
            spaceship.decreaseFuelLevel()
            qtdFuel.text = String(spaceship.fuelLevel)
            counter = counter + 1
            
           // insideProgressBar.decrease(qtd: counter)
            insideProgressBar.change(increase: -2)
            //insideProgressBar.position.x -= 1
            //setFuelBar(decrease: 2)
            
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        if !(scene?.isPaused)!
        {
            surface.position = CGPoint(x:surface.position.x - 5,y:surface.position.y)
            surface2.position = CGPoint(x:surface2.position.x - 5,y:surface2.position.y)
            
            if surface.position.x <= -surface.size.width
            {
                surface.position = CGPoint(x:surface2.position.x + surface2.size.width,y:surface.position.y)
            }
            if surface2.position.x <= -surface2.size.width
            {
                surface2.position = CGPoint(x:surface.position.x + surface.size.width,y:surface2.position.y)
            }
            for rock in realrocks
            {
                let rockMove3 = SKAction.applyForce(CGVector(dx: -0.1, dy: 0), duration: 0.5)
                rock.run(rockMove3)
            }
            for gem in realgems
            {
                let gemMove = SKAction.applyForce(CGVector(dx: -0.1, dy: 0), duration: 0.5)
                gem.run(gemMove)
            }
            for fuelDrop in realFuelDrops
            {
                let fuelMove = SKAction.applyForce(CGVector(dx: -0.1, dy: 0), duration: 0.5)
                fuelDrop.run(fuelMove)
            }
            if isDead()
             {
                let transition = SKTransition.fade(withDuration: 1.0)
                let  scene = GameOverScene()
                let skView = self.view! as SKView
                skView.ignoresSiblingOrder = false
                scene.size = skView.bounds.size
                scene.scaleMode = .aspectFill
               skView.presentScene(scene, transition: transition)
             }
        }
        if spaceship.position.x > realgems[realgems.count-1].position.x && spaceship.position.y > realgems[realgems.count-1].position.y
        {
             let transition = SKTransition.fade(withDuration: 1.0)
            let  scene = LevelCompletedScene()
            let skView = self.view! as SKView
            skView.ignoresSiblingOrder = false
            scene.size = skView.bounds.size
            scene.scaleMode = .aspectFill
            skView.presentScene(scene, transition: transition)

        }
    }
    
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
    func setUpRocks()
    {
        realrocks.removeAll()
        for i in 0...level.rocks.count - 1
        {
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
    func setUpGems()
    {
        
        realgems.removeAll()
        for i in 0...level.gems.count - 1
        {
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
    func setUpFuelDrops()
    {
        
        realFuelDrops.removeAll()
        for i in 0...level.fueldrops.count - 1
        {
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
    func setUpOxygenDrops()
    {
        realOxygenDrops.removeAll()
        for i in 0...level.oxygendrops.count - 1
        {
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
            spaceship = Spaceship(fuelLevel: 100)
            addChild(spaceship)
        }
        else {
            astronaut = Astronaut(oxygenLevel: 100)
            addChild(astronaut)
        }
    }
    
    func isDead() -> Bool {
        if spaceship.position.y < 0 || spaceship.position.y > UIScreen.main.bounds.height {
            print("\nYou're dead.\n")
            return true
        }
        else {
            print("\nYou're NOT dead.\n")
            return false
        }
    }
}
