//
//  PlanetsScene.swift
//  Joguinho
//
//  Created by Felipe Viberti on 16/11/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import SpriteKit

class PlanetsScene: SKScene{
    
    
    var neptune: Component!
    var uranus: Component!
    var saturn: Component!
    var jupiter: Component!
    var mars: Component!
    var earth: Component!
    var venus: Component!
    var mercury: Component!
    var saturnShade:Component!
    var back: SKSpriteNode!
    
    
    override func didMove(to view: SKView) {
        
//        self.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        let size = view.frame.size
        
        //backgroung
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        background.size = CGSize(width: 667 * size.width / 667, height: 375 * size.height / 375)
        addChild(background)
        
        back = SKSpriteNode(imageNamed: "back")
        back.position = CGPoint(x: 53 * size.width / 667, y: 350 * size.height / 375)
        back.size = CGSize(width: 58 * size.width / 667, height: 22 * size.height / 375)
        self.addChild(back)
        
        
        //neptune
        neptune = Component(imageNamed: "Neptune")
//        neptune.position = CGPoint(x: 50.5 * size.width / 667, y: 216 * size.height / 375)
        neptune.position = CGPoint(x: 50.5 * size.width / 667, y: frame.size.height / 2)
        neptune.size = CGSize(width: 49 * size.width / 667, height: 49 * size.height / 375)
        addChild(neptune)
        
        
        //uranus
   /*     uranus = Component(imageNamed: "Uranus")
        uranus.position = CGPoint(x: 124.5 * size.width / 667, y: frame.size.height / 2)
        uranus.size = CGSize(width: 51 * size.width / 667, height: 65 * size.height / 375)
        addChild(uranus)
 */
        //Uranus blocked
        uranus = Component(imageNamed: "uranusShade")
        uranus.position = CGPoint(x: 124.5 * size.width / 667, y: frame.size.height / 2)
        uranus.size = CGSize(width: 51 * size.width / 667, height: 65 * size.height / 375)
        addChild(uranus)
        
        //saturn
      /*  saturn = Component(imageNamed: "Saturn")
        saturn.position = CGPoint(x: 237 * size.width / 667, y: frame.size.height / 2)
        saturn.size = CGSize(width: 158 * size.width / 667, height: 116 * size.height / 375)
        addChild(saturn)
 */
        //Saturn blocked
        saturnShade = Component(imageNamed: "saturnShade")
        saturnShade.position = CGPoint(x: 237 * size.width / 667, y: frame.size.height / 2)
        saturnShade.size = CGSize(width: 158 * size.width / 667, height: 116 * size.height / 375)
        addChild(saturnShade)

        
        //jupiter
     /*   jupiter = Component(imageNamed: "Jupiter")
        jupiter.position = CGPoint(x: 393 * size.width / 667, y: frame.size.height / 2)
        jupiter.size = CGSize(width: 140 * size.width / 667, height: 140 * size.height / 375)
        addChild(jupiter)
    */
        //Jupiter blocked
        jupiter = Component(imageNamed: "jupiterShade")
        jupiter.position = CGPoint(x: 393 * size.width / 667, y: frame.size.height / 2)
        jupiter.size = CGSize(width: 140 * size.width / 667, height: 140 * size.height / 375)
        addChild(jupiter)
        //mars
    /*    mars = Component(imageNamed: "Mars")
        mars.position = CGPoint(x: 489.5 * size.width / 667, y: frame.size.height / 2)
        mars.size = CGSize(width: 7 * size.width / 667, height: 7 * size.height / 375)
        addChild(mars)
    */
        //Mars blocked
        mars = Component(imageNamed: "marsShade")
        mars.position = CGPoint(x: 489.5 * size.width / 667, y: frame.size.height / 2)
        mars.size = CGSize(width: 7 * size.width / 667, height: 7 * size.height / 375)
        addChild(mars)
        
        //earth
      /*  earth = Component(imageNamed: "Earth")
        earth.position = CGPoint(x: 520.5 * size.width / 667, y: frame.size.height / 2)
        earth.size = CGSize(width: 13 * size.width / 667, height: 13 * size.height / 375)
        addChild(earth)
     */
        //Earth blocked
        earth = Component(imageNamed: "terraShade")
        earth.position = CGPoint(x: 520.5 * size.width / 667, y: frame.size.height / 2)
        earth.size = CGSize(width: 13 * size.width / 667, height: 13 * size.height / 375)
        addChild(earth)
        
        //venus
     /*   venus = Component(imageNamed: "Venus")
        venus.position = CGPoint(x: 551.5 * size.width / 667, y: frame.size.height / 2)
        venus.size = CGSize(width: 13 * size.width / 667, height: 13 * size.height / 375)
        addChild(venus)
       */
        //Venus blocked
        venus = Component(imageNamed: "venusShade")
        venus.position = CGPoint(x: 551.5 * size.width / 667, y: frame.size.height / 2)
        venus.size = CGSize(width: 13 * size.width / 667, height: 13 * size.height / 375)
        addChild(venus)
        
        //mercury
      /*  mercury = Component(imageNamed: "Mercury")
        mercury.position = CGPoint(x: 580.5 * size.width / 667, y: frame.size.height / 2)
        mercury.size = CGSize(width: 5 * size.width / 667, height: 5 * size.height / 375)
        addChild(mercury)
     */
        mercury = Component(imageNamed: "mercuryShade")
        mercury.position = CGPoint(x: 580.5 * size.width / 667, y: frame.size.height / 2)
        mercury.size = CGSize(width: 5 * size.width / 667, height: 5 * size.height / 375)
        addChild(mercury)
        //sun
        let sun = SKSpriteNode(imageNamed: "Sun")
        sun.position = CGPoint(x: 844 * size.width / 667, y: frame.size.height / 2)
        sun.size = CGSize(width: 466 * size.width / 667, height: 466 * size.height / 375)
        addChild(sun)
        
        
    }
    
    
    //FUNCAO USADA PARA ACHAR QUAL BOTAO/PLANETA FOI SELECIONADO!
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            // Get the location of the touch in this scene
            let location = (touch as AnyObject).location(in: self)
            // Check if the location of the touch is within the button's bounds
            if neptune.contains(location) {
                print("tapped Neptune!")
                
                let planet = Planet(name: PlanetName.Neptune, gravity: 1.15, type: PlanetType.gaseous)
                let transition = SKTransition.reveal(with: SKTransitionDirection.up, duration: 1.0)
                let transition2 = SKTransition.doorway(withDuration: 1.0)
                let nextScene = SelectedPlanetScene(size: self.size)
                nextScene.scaleMode = SKSceneScaleMode.aspectFill
                nextScene.selectedPlanetClass = planet
                self.scene?.view?.presentScene(nextScene, transition: transition2)
            }
            
            if self.nodes(at: location)[0] == self.back{
                let scene = FirstScene()
                let skView = self.view! as SKView
                let transition = SKTransition.fade(withDuration: 1.0)
                skView.ignoresSiblingOrder = false
                scene.size = skView.bounds.size
                scene.scaleMode = .aspectFill
                skView.presentScene(scene, transition: transition)
            }
        }
    }
}
