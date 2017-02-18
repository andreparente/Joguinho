//
//  GameScene.swift
//  Joguinho
//
//  Created by Andre Machado Parente on 10/21/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var level: Level!
    var background = Component(imageNamed:"background")
    var progressBar = Component(imageNamed: "fuelbar")
    var insideProgressBar: FuelBar!
    var surface: Component!
    var surface2: Component!
    var spaceship: Spaceship!
    var astronaut: Astronaut!
    var realrocks:[Component] = [Component(imageNamed: "rock1")]
    var realgems:[Gem] = [Gem(originPlanet: PlanetName.Neptune)]
    var realFuelDrops:[SurvivalArtifact] = [SurvivalArtifact(type: Artifact(rawValue: "Fuel")!)]
    var realOxygenDrops:[SurvivalArtifact] = [SurvivalArtifact(type: Artifact(rawValue: "Oxygen")!)]
    var pauseButton = Component(imageNamed: "pause")
    var countGems: SKLabelNode!
    var gemsCounter: Int = 0
    var timer:Timer!
    var TextureAtlas = SKTextureAtlas()
    var TextureArray = [SKTexture]()
    var rockName:[Int] = []
    var fuelDropname : [String] = []
    var gemName : [String] = []
    var currentlyTouching:Bool!
    var backgroundSound:AVAudioPlayer!
    var hitRockSound:AVAudioPlayer!
    var spaceshipOnSound:AVAudioPlayer!
    var gemCaughtSound:AVAudioPlayer!
    var fuelCaughtSound:AVAudioPlayer!
    var countDownLabel:SKLabelNode!
    var timerDidEnd:Bool = false
    var cauhgtFinalGem:Bool = false
    
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
            
            currentlyTouching = false
            checkPlanet()
            setUpPlayer()
            setUpFuelBar()
            spaceship.startMoment()
            setPauseButton()
            setUpRocks()
            setUpGems()
            setUpCountGems()
            
            if level.planet.type == PlanetType.gaseous {
                setUpFuelDrops()
            }
            else {
                setUpOxygenDrops()
            }
            produceBackgroundSound()
        }
        setUpCountDownLabel()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true);
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
                    
                    if userDefaults.bool(forKey: "soundOn") {
                        produceSoundWhenCaughtFuel()
                    }
                    insideProgressBar.change(increase: 15)
                    fuelDropname.remove(at: index!)
                }
                k+=1
            case  CollisionTypes.gem.rawValue:
                let name1 = secondBody.node?.name
                let index = gemName.index(of: name1!)
                
                if gemName.contains(name1!) {
                    
                    if userDefaults.bool(forKey: "soundOn") {
                        produceSoundWhenCaughtGem()
                    }
                    secondBody.node?.removeFromParent()
                    gemsCounter += 1
                    countGems.text = "\(gemsCounter)/\(realgems.count)"
                    userDefaults.set(userDefaults.value(forKey: "coinsBalance") as! Int + 1, forKey: "coinsBalance")
                    player.coinsBalance = userDefaults.value(forKey: "coinsBalance") as! Int
                    gemName.remove(at: index!)
                }
                if secondBody.node?.name == realgems[realgems.count - 1].name
                {
                    cauhgtFinalGem = true
                    actWhenCompletedLevel()
                }
                k+=1
            case CollisionTypes.rock.rawValue:
                if userDefaults.bool(forKey: "soundOn") {
                AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
                }
                k+=1
            default:
                break
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        currentlyTouching = true
        spaceship.fireMovement()

        //        produceSoundWhenSpaceshipOn()
        if !(scene?.isPaused)!
        {
            let rotate = SKAction.rotate(toAngle: 0.5, duration: 0.8)
            spaceship.run(rotate)
            for touch in touches
            {
                let location = touch.location(in: self)
                if self.nodes(at: location)[0] == self.pauseButton
                {
                    scene?.isPaused = true
                    currentlyTouching = false
                    let  scene1 = PauseScene()
                    let skView = self.view! as SKView
                    let transition = SKTransition.fade(withDuration: 1.0)
                    scene1.currentSceneState = self
                    skView.ignoresSiblingOrder = false
                    scene1.size = skView.bounds.size
                    scene1.scaleMode = .aspectFill
                    skView.presentScene(scene1, transition: transition)
                    
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        currentlyTouching = false
        //  spaceshipOnSound.stop()
    }
    
    override func update(_ currentTime: TimeInterval) {
        if !timerDidEnd{
            scene?.isPaused = true
        }
        
        if !(scene?.isPaused)! {
            surface.position = CGPoint(x:surface.position.x - 5,y:surface.position.y)
            surface2.position = CGPoint(x:surface2.position.x - 5,y:surface2.position.y)
            
            if surface.position.x <= -surface.size.width {
                surface.position = CGPoint(x:surface2.position.x + surface2.size.width,y:surface.position.y)
            }
            if surface2.position.x <= -surface2.size.width {
                surface2.position = CGPoint(x:surface.position.x + surface.size.width,y:surface2.position.y)
            }
            
            if currentlyTouching == true {
                spaceship.spaceshipMovement()
                
                if insideProgressBar.spaceship.fuelLevel < 2 {
                    insideProgressBar.finish()
                } else {
                    insideProgressBar.change(increase: -0.8)

                }
            }
                
            else {
                spaceship.drag()
                spaceship.removeAllChildren()
            }
            setUpActionsForComponents()
            
            if cauhgtFinalGem || spaceship.position.x > realgems[realgems.count-1].position.x   {
                actWhenCompletedLevel()
            }
            
            if isDead() {
                actWhenDead()
            }
            
        }
    }
    
    
    //MARK:Specific setup for each planet
    
    func checkPlanet() {
        //Aqui é onde as funções de Setup dos outros Planetas vão ser chamadas
        switch level.planet.name.rawValue {
        case PlanetName.Neptune.rawValue:
            setUpInitialSceneNeptune()
            
        case PlanetName.Uranus.rawValue:
             setUpInitialSceneUranus()
        
        case PlanetName.Saturn.rawValue:
            setUpInitialSceneSaturn()
            
        default:
            setUpInitialSceneNeptune()
        }
    }
    
    func setUpInitialSceneNeptune() {
        background.anchorPoint = CGPoint(x: 0, y: 0)
        background.position = CGPoint(x: 0, y: 0)
        background.zPosition = 1
        background.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        addChild(background)
        
        
        surface.position = CGPoint(x: 0, y: surface.size.height/3)
        surface.zPosition = 2
        surface.size = CGSize(width: UIScreen.main.bounds.width + 800, height: surface.size.height)
        addChild(surface)
        
        
        surface2.position = CGPoint(x: surface.size.width, y: surface.size.height/3)
        surface2.zPosition = 2
        surface2.size = CGSize(width: UIScreen.main.bounds.width + 800, height: surface.size.height)
        addChild(surface2)
    }
    
    func setUpInitialSceneUranus() {
        
    }
    
    func setUpInitialSceneSaturn() {
        
    }
    
    //MARK: General Setup Functions
    
    func countDown() {
        countDownLabel.text = String(Int(countDownLabel.text!)! - 1)
        if countDownLabel.text == "0" {
            timer.invalidate()
            countDownLabel.removeFromParent()
            scene?.isPaused = false
            timerDidEnd = true
        }
    }
    func setUpCountDownLabel() {
        countDownLabel = SKLabelNode(fontNamed: "Futura")
        countDownLabel.text = "3"
        countDownLabel.position = CGPoint(x: screenSize.width/2, y: screenSize.height/2)
        countDownLabel.color = UIColor.black
        countDownLabel.fontSize = 40
        countDownLabel.zPosition = 10
        addChild(countDownLabel)
        
    }

    
    func setUpFuelBar() {
        progressBar.zPosition = 4
        progressBar.position = CGPoint(x: screenSize.width/2, y: 7*screenSize.height/8)
        addChild(progressBar)
        
        insideProgressBar = FuelBar(image: "fuel", spaceship: self.spaceship)
        insideProgressBar.zPosition = 5
        addChild(insideProgressBar)
       
    }
    
    func setUpCountGems() {
        
        countGems = SKLabelNode(fontNamed: "Futura")
        countGems.text = "0/\(realgems.count)"
        countGems.fontSize = 20
        countGems.color = UIColor.white
        countGems.position = CGPoint(x: 60 * size.width / 667 , y:progressBar.position.y - 10)
        countGems.zPosition = 4
        addChild(countGems)
        
    }
    
    func setPauseButton() {
        pauseButton.position = CGPoint(x: 610 * size.width / 667, y: 7*screenSize.height/8)
        pauseButton.zPosition = 4
        addChild(pauseButton)
        
    }
    
    
    func setUpRocks() {
        realrocks.removeAll()
        var cont = 1
        for i in 0...level.rocks.count - 1 {
            if cont > 5 {
                cont = 1
            }
            realrocks.append(Component(imageNamed: "rock\(cont)"))
            realrocks[i].name = "Rock\(i)"
            rockName.append(cont)
            realrocks[i].position = level.rocks[i]
            realrocks[i].zPosition = 10
            realrocks[i].physicsBody = SKPhysicsBody(texture: realrocks[i].texture!,alphaThreshold: 0.02,
                                                     size: CGSize(width: realrocks[i].size.width, height: realrocks[i].size.height))
            realrocks[i].physicsBody?.affectedByGravity = false
            realrocks[i].physicsBody?.velocity = CGVector(dx: 0, dy: 0)
            realrocks[i].physicsBody?.categoryBitMask = CollisionTypes.rock.rawValue
            realrocks[i].physicsBody?.contactTestBitMask = CollisionTypes.player.rawValue
            realrocks[i].physicsBody?.collisionBitMask = CollisionTypes.player.rawValue
            cont+=1
            self.addChild(realrocks[i])
        }
    }
    
    
    func setUpGems() {
        
        realgems.removeAll()
        for i in 0...level.gems.count - 1 {
            
            realgems.append(Gem(originPlanet: level.planet.name))
            realgems[i].name = "Gem\(i)"
            gemName.append(realgems[i].name!)
            realgems[i].position = level.gems[i]
            realgems[i].zPosition = 10
            realgems[i].physicsBody = SKPhysicsBody(texture: realgems[i].texture!, alphaThreshold: 0.02, size: CGSize(width: realgems[i].size.width, height: realgems[i].size.height))
            realgems[i].physicsBody?.affectedByGravity = false
            realgems[i].physicsBody?.categoryBitMask = CollisionTypes.gem.rawValue
            realgems[i].physicsBody?.contactTestBitMask = CollisionTypes.player.rawValue
            realgems[i].physicsBody?.collisionBitMask = 0
            
            if i == level.gems.count - 1
            {
                realgems[i].size = CGSize(width: screenSize.width/2 * 21/38, height: screenSize.height/2)
            }
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
            realrocks[i].physicsBody?.contactTestBitMask = CollisionTypes.player.rawValue
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
            spaceship = Spaceship(fuelLevel: 350, spaceShipName: "rocket fase")
            addChild(spaceship)
        }
        else {
            astronaut = Astronaut(oxygenLevel: 100)
            addChild(astronaut)
        }
    }
    
    
    func setUpActionsForComponents() {
        var i = 0
        var rockMove3 = SKAction()
        for rock in realrocks {
            switch rockName[i]
            {
            case 1:
                rockMove3 = SKAction.applyForce(CGVector(dx: -0.1, dy: 0), duration: 0.5)
            case 2:
                rockMove3 = SKAction.applyForce(CGVector(dx: -0000.1, dy: 0), duration: 0.2)
            case 3:
                rockMove3 = SKAction.applyForce(CGVector(dx: -0.1, dy: 0), duration: 0.5)
            case 4:
                rockMove3 = SKAction.applyForce(CGVector(dx: -0000.1, dy: 0), duration: 0.2)
            case 5:
                rockMove3 = SKAction.applyForce(CGVector(dx: -0000.1, dy: 0), duration: 0.2)
            default:
                break
            }
            rock.run(rockMove3)
            i+=1
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
    //MARK:Pause Functions
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
    
    //MARK:Actions Functions
    
    func isDead() -> Bool {
        let spaceshipRightBoundsX = spaceship.position.x + spaceship.frame.width/2
        let spaceshipLeftBoundsX = spaceship.position.x - spaceship.frame.width/2
        let spaceshipUpBoundsY = spaceship.position.y + spaceship.frame.height/2
        let spaceshipDownBoundsY = spaceship.position.y - spaceship.frame.height/2
        
        if (spaceshipUpBoundsY < 10) || (spaceshipDownBoundsY > (screenSize.height - 10)) || (spaceshipRightBoundsX < 0)  || (spaceshipLeftBoundsX > screenSize.width) || (spaceship.fuelLevel <= 0) {
            
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
        let spaceshipLeftBoundsX = spaceship.position.x - spaceship.frame.width/2
        let spaceshipUpBoundsY = spaceship.position.y + spaceship.frame.height/2
        self.view?.isUserInteractionEnabled = false
        spaceship.winningMove()
        
        if spaceshipLeftBoundsX > screenSize.width || spaceshipUpBoundsY > screenSize.height{
            let transition = SKTransition.fade(withDuration: 1.0)
            let  scene = LevelCompletedScene()
            scene.level = self.level.id
            let skView = self.view! as SKView
            skView.ignoresSiblingOrder = false
            scene.size = skView.bounds.size
            scene.scaleMode = .aspectFill
            scene.spaceShip = spaceship
            scene.gemsCollected = Double(gemsCounter)
            scene.totalGems = Double(realgems.count)
            skView.presentScene(scene, transition: transition)
        }
    }
    
    func animateRock(i:Int) {
        TextureAtlas = SKTextureAtlas (named: "rock")
        for i in 1...TextureAtlas.textureNames.count{
            let name = "rock\(i).png"
            TextureArray.append(SKTexture(imageNamed: name))
        }
        realrocks[i] = Component(imageNamed: TextureAtlas.textureNames[0])
        let action = SKAction.repeatForever(SKAction.animate(with: TextureArray, timePerFrame: 0.1))
        realrocks[i].run(action, withKey: "rockMovement")
        addChild(realrocks[i])
        
    }
    func handleCollisionWithRock(name:String) {
        var index:Int = 0
        for i  in 0...realrocks.count - 1
        {
            if realrocks[i].name == name
            {
                index = i
                break
            }
            
        }
        produceSoundWhenHitRock()
        animateRock(i: index)
    }
    
    //MARK:Sound functions
    
    func produceBackgroundSound () {
        let path = Bundle.main.path(forResource: "background2.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)

        if userDefaults.bool(forKey: "soundOn") {
            do {
                let sound = try AVAudioPlayer(contentsOf: url)
                backgroundSound = sound
                sound.volume = 0.1
                sound.play()
            } catch {
                // couldn't load file :(
                print("Couldn't load file")
            }
        }

    }
    
    func produceSoundWhenHitRock() {
        if hitRockSound != nil
        {
            if !(hitRockSound.isPlaying)
            {
                let path = Bundle.main.path(forResource: "rockCollision.mp3", ofType:nil)!
                let url = URL(fileURLWithPath: path)
                do {
                    let sound = try AVAudioPlayer(contentsOf: url)
                    hitRockSound = sound
                    sound.volume = 0.1
                    sound.play()
                } catch {
                    print("File sound couldn't be loaded")
                }
            }
        }
    }
    
    func produceSoundWhenSpaceshipOn() {
        let path = Bundle.main.path(forResource: "fuelSound.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        do {
            let sound = try AVAudioPlayer(contentsOf: url)
            spaceshipOnSound = sound
            sound.play()
        } catch {
            print("File sound couldn't be loaded")
        }
    }
    
    func produceSoundWhenCaughtGem() {
        let path = Bundle.main.path(forResource: "gemSound.wav", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        do {
            let sound = try AVAudioPlayer(contentsOf: url)
            gemCaughtSound = sound
            sound.play()
        } catch {
            print("File sound couldn't be loaded")
        }
        
    }
    
    func produceSoundWhenCaughtFuel(){
        let path = Bundle.main.path(forResource: "fuelSound.mp3", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        do{
            let sound = try AVAudioPlayer(contentsOf: url)
            fuelCaughtSound = sound
            sound.play()
        } catch {
            print("File sound couldn't be loaded")
        }
        
    }
}
