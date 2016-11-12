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

struct PhysicsCategory {
    static let None      : UInt32 = 0
    static let All       : UInt32 = UInt32.max
    static let Monster   : UInt32 = 0b1
    static let Projectile: UInt32 = 0b10
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var level: Level!
    var background = Component(imageNamed:"background")
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
        spaceship.startMoment()
        
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
//        spaceship.physicsBody?.categoryBitMask = PhysicsCategory.Monster
//        spaceship.physicsBody?.contactTestBitMask = PhysicsCategory.Projectile
        progressView.center = CGPoint(x: 300, y: 40)
        progressView.progress = 0.8
        progressView.progressTintColor = UIColor.white
        progressView.backgroundColor = UIColor.orange
        
        view.addSubview(progressView)
      
    }
    override func sceneDidLoad() {

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        spaceship.spaceshipMovement()
    }
    
    override func update(_ currentTime: TimeInterval) {
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
        if isDead()
        {
            //Chamar a View que é mostrada quando o player morre
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
            realrocks[i].position = level.rocks[i]
            realrocks[i].zPosition = 10
            realrocks[i].physicsBody = SKPhysicsBody(texture: realrocks[i].texture!,
                                                     size: CGSize(width: realrocks[i].size.width, height: realrocks[i].size.height))
            realrocks[i].physicsBody?.affectedByGravity = false
            let rockMove3 = SKAction.applyForce(CGVector(dx: -20, dy: 0), duration: 2)
           realrocks[i].run(rockMove3)
            self.addChild(realrocks[i])
        }
    }
    func setUpGems()
    {
       
        realgems.removeAll()
        for i in 0...level.gems.count - 1
        {
            realgems.append(Component(imageNamed: "crystal"))
            realgems[i].position = level.gems[i]
            realgems[i].zPosition = 10
            realgems[i].physicsBody = SKPhysicsBody(texture: realgems[i].texture!,
                                                     size: CGSize(width: realgems[i].size.width, height: realgems[i].size.height))
            realgems[i].physicsBody?.affectedByGravity = false
            let gemMove = SKAction.applyForce(CGVector(dx: -20, dy: 0), duration: 2)
            realgems[i].physicsBody?.categoryBitMask = PhysicsCategory.None
            realgems[i].run(gemMove)
            self.addChild(realgems[i])
        }

    }
    func setUpFuelDrops()
    {
      
        realFuelDrops.removeAll()
        for i in 0...level.fueldrops.count - 1
        {
            realFuelDrops.append(SurvivalArtifact(type: Artifact(rawValue: "Fuel")!))
            realFuelDrops[i].position = level.fueldrops[i]
            realFuelDrops[i].zPosition = 10
            realFuelDrops[i].physicsBody = SKPhysicsBody(texture: realFuelDrops[i].texture!,size: CGSize(width: realFuelDrops[i].size.width, height: realFuelDrops[i].size.height))
            realFuelDrops[i].physicsBody?.affectedByGravity = false
            let fuelMove = SKAction.applyForce(CGVector(dx: -20, dy: 0), duration: 2)
            realFuelDrops[i].run(fuelMove)
            self.addChild(realFuelDrops[i])
        }

    }
    func setUpOxygenDrops()
    {
        realOxygenDrops.removeAll()
        for i in 0...level.oxygendrops.count - 1
        {
            realOxygenDrops.append(SurvivalArtifact(type: Artifact(rawValue: "Oxygen")!))
            realOxygenDrops[i].position = level.oxygendrops[i]
            realOxygenDrops[i].zPosition = 10
            realOxygenDrops[i].physicsBody = SKPhysicsBody(texture: realOxygenDrops[i].texture!,size: CGSize(width: realOxygenDrops[i].size.width, height: realOxygenDrops[i].size.height))
            realOxygenDrops[i].physicsBody?.affectedByGravity = false
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
