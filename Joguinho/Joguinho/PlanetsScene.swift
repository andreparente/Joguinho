//
//  PlanetsScene.swift
//  Joguinho
//
//  Created by Felipe Viberti on 16/11/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import SpriteKit

class PlanetsScene: SKScene

{
    
  /*  override func didMove(to view: SKView) {
    
        view.backgroundColor = UIColor.init(patternImage: UIImage(named: "background")!)
        
        let size = view.frame.size
        
        
        //neptune
        let neptune = Component(imageNamed: "Neptune")
        //Aqui tem que mexer na position e não no frame
        neptune.frame = CGRect(x: 26 * size.width / 667, y: 159 * size.height / 375, width: neptune.width * size.width / 667, height: neptune.height * size.height / 375)
        
        neptune.addTarget(self, action: #selector(selectedPlanet), for: UIControlEvents.touchUpInside)
        addChild(neptune)
        
        //uranus
        let uranusImage = UIImage(named: "Uranus")
        let uranusView = UIImageView(image: uranusImage)
        let uranusSize = uranusView.frame.size
        let uranus = UIButton()
        uranus.setImage(uranusImage, for: UIControlState())
        uranus.frame = CGRect(x: 99 * size.width / 667, y: 150 * size.height / 375, width: uranusSize.width * size.width / 667, height: uranusSize.height * size.height / 375)
        uranus.tag = 2
        uranus.addTarget(self, action: #selector(selectedPlanet), for: UIControlEvents.touchUpInside)
        self.content.addSubview(uranus)
        
        //saturn
        let saturnImage = UIImage(named: "Saturn")
        let saturnView = UIImageView(image: saturnImage)
        let saturnSize = saturnView.frame.size
        let saturn = UIButton()
        saturn.setImage(saturnImage, for: UIControlState())
        saturn.frame = CGRect(x: 164 * size.width / 667, y: 125 * size.height / 375, width: saturnSize.width * size.width / 667, height: saturnSize.height * size.height / 375)
        saturn.tag = 3
        saturn.addTarget(self, action: #selector(selectedPlanet), for: UIControlEvents.touchUpInside)
        self.content.addSubview(saturn)
        
        //jupiter
        let jupiterImage = UIImage(named: "Jupiter")
        let jupiterView = UIImageView(image: jupiterImage)
        let jupiterSize = jupiterView.frame.size
        let jupiter = UIButton()
        jupiter.setImage(jupiterImage, for: UIControlState())
        jupiter.frame = CGRect(x: 323 * size.width / 667, y: 113 * size.height / 375, width: jupiterSize.width * size.width / 667, height: jupiterSize.height * size.height / 375)
        jupiter.tag = 4
        jupiter.addTarget(self, action: #selector(selectedPlanet), for: UIControlEvents.touchUpInside)
        self.content.addSubview(jupiter)
        
        //mars
        let marsImage = UIImage(named: "Mars")
        let marsView = UIImageView(image: marsImage)
        let marsSize = marsView.frame.size
        let mars = UIButton()
        mars.setImage(marsImage, for: UIControlState())
        mars.frame = CGRect(x: 486 * size.width / 667, y: 180 * size.height / 375, width: marsSize.width * size.width / 667, height: marsSize.height * size.height / 375)
        mars.tag = 5
        mars.addTarget(self, action: #selector(selectedPlanet), for: UIControlEvents.touchUpInside)
        self.content.addSubview(mars)
        
        //earth
        let earthImage = UIImage(named: "Earth")
        let earthView = UIImageView(image: earthImage)
        let earthSize = earthView.frame.size
        let earth = UIButton()
        earth.setImage(earthImage, for: UIControlState())
        earth.frame = CGRect(x: 514 * size.width / 667, y: 177 * size.height / 375, width: earthSize.width * size.width / 667, height: earthSize.height * size.height / 375)
        earth.tag = 6
        earth.addTarget(self, action: #selector(selectedPlanet), for: UIControlEvents.touchUpInside)
        self.content.addSubview(earth)
        
        //venus
        let venusImage = UIImage(named: "Venus")
        let venusView = UIImageView(image: venusImage)
        let venusSize = venusView.frame.size
        let venus = UIButton()
        venus.setImage(venusImage, for: UIControlState())
        venus.frame = CGRect(x: 545 * size.width / 667, y: 177 * size.height / 375, width: venusSize.width * size.width / 667, height: venusSize.height * size.height / 375)
        venus.tag = 7
        venus.addTarget(self, action: #selector(selectedPlanet), for: UIControlEvents.touchUpInside)
        self.content.addSubview(venus)
        
        //mercury
        let mercuryImage = UIImage(named: "Mercury")
        let mercuryView = UIImageView(image: mercuryImage)
        let mercurySize = mercuryView.frame.size
        let mercury = UIButton()
        mercury.setImage(mercuryImage, for: UIControlState())
        mercury.frame = CGRect(x: 578 * size.width / 667, y: 181 * size.height / 375, width: mercurySize.width * size.width / 667, height: mercurySize.height * size.height / 375)
        mercury.tag = 8
        mercury.addTarget(self, action: #selector(selectedPlanet), for: UIControlEvents.touchUpInside)
        self.content.addSubview(mercury)
        
        //sun
        let sunImage = UIImage(named: "Sun")
        let sunView = UIImageView(image: sunImage)
        let sunSize = sunView.frame.size
        sunView.frame = CGRect(x: 611 * size.width / 667, y: -49 * size.height / 375, width: sunSize.width * size.width / 667, height: sunSize.height * size.height / 375)
        self.content.addSubview(sunView)
        
        
    }
    
  
    
    func selectedPlanet(_ sender:UIButton){
        //currentPlanet = planet
        var btSendTag:UIButton = sender
        switch btSendTag.tag {
        case 1:
            currentPlanet = Planet(name: PlanetName.Neptune, gravity: 1.115, type:PlanetType.gaseous)
        case 2:
            currentPlanet = Planet(name: PlanetName.Uranus, gravity: 0.887, type:PlanetType.gaseous)
        case 3:
            currentPlanet = Planet(name: PlanetName.Saturn, gravity: 1.044, type:PlanetType.gaseous)
        case 4:
            currentPlanet = Planet(name: PlanetName.Jupiter, gravity: 2.492, type:PlanetType.gaseous)
        case 5:
            currentPlanet = Planet(name: PlanetName.Mars, gravity: 0.371, type: PlanetType.terrestrial)
        case 6:
            currentPlanet = Planet(name: PlanetName.Earth, gravity: 0.97, type: PlanetType.terrestrial)
        case 7:
            currentPlanet = Planet(name: PlanetName.Venus, gravity: 0.887, type: PlanetType.terrestrial)
        case 8:
            currentPlanet = Planet(name: PlanetName.Mercury, gravity: 0.37, type: PlanetType.terrestrial)
        default:
            break
        }
        let  scene = SelectedPlanetScene()
        let skView = self.view! as SKView
        skView.ignoresSiblingOrder = false
        scene.size = skView.bounds.size
        scene.scaleMode = .aspectFill
        skView.presentScene(scene)
*/
   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    for touch in touches
    {
        let location = touch.location(in: self)
        
    }
}
}
