//
//  PlanetsViewController.swift
//  Joguinho
//
//  Created by Felipe Viberti on 09/11/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import UIKit

class PlanetsViewController: UIViewController, UIScrollViewDelegate {
    
    let scroll = UIScrollView()
    let content = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scroll.delegate = self
        scroll.frame.size = view.frame.size
        scroll.minimumZoomScale = 0.1
        scroll.maximumZoomScale = 4.0
        scroll.zoomScale = 1.0
        view.addSubview(scroll)
        
        content.frame.size = scroll.frame.size
        scroll.contentSize = content.frame.size
        scroll.addSubview(content)
        
        view.backgroundColor = UIColor.init(patternImage: UIImage(named: "background")!)
        
        let size = view.frame.size

        
        //neptune
        let neptuneImage = UIImage(named: "Neptune")
        let neptuneView = UIImageView(image: neptuneImage)
        let neptuneSize = neptuneView.frame.size
        let neptune = UIButton()
        neptune.setImage(neptuneImage, for: UIControlState())
        neptune.frame = CGRect(x: 26 * size.width / 667, y: 159 * size.height / 375, width: neptuneSize.width * size.width / 667, height: neptuneSize.height * size.height / 375)
        neptune.addTarget(self, action: #selector(PlanetsViewController.selectedPlanet), for: UIControlEvents.touchUpInside)
        self.content.addSubview(neptune)
        
        //uranus
        let uranusImage = UIImage(named: "Uranus")
        let uranusView = UIImageView(image: uranusImage)
        let uranusSize = uranusView.frame.size
        let uranus = UIButton()
        uranus.setImage(uranusImage, for: UIControlState())
        uranus.frame = CGRect(x: 99 * size.width / 667, y: 150 * size.height / 375, width: uranusSize.width * size.width / 667, height: uranusSize.height * size.height / 375)
        uranus.addTarget(self, action: #selector(PlanetsViewController.selectedPlanet), for: UIControlEvents.touchUpInside)
        self.content.addSubview(uranus)
        
        //saturn
        let saturnImage = UIImage(named: "Saturn")
        let saturnView = UIImageView(image: saturnImage)
        let saturnSize = saturnView.frame.size
        let saturn = UIButton()
        saturn.setImage(saturnImage, for: UIControlState())
        saturn.frame = CGRect(x: 164 * size.width / 667, y: 125 * size.height / 375, width: saturnSize.width * size.width / 667, height: saturnSize.height * size.height / 375)
        saturn.addTarget(self, action: #selector(PlanetsViewController.selectedPlanet), for: UIControlEvents.touchUpInside)
        self.content.addSubview(saturn)
        
        //jupiter
        let jupiterImage = UIImage(named: "Jupiter")
        let jupiterView = UIImageView(image: jupiterImage)
        let jupiterSize = jupiterView.frame.size
        let jupiter = UIButton()
        jupiter.setImage(jupiterImage, for: UIControlState())
        jupiter.frame = CGRect(x: 323 * size.width / 667, y: 113 * size.height / 375, width: jupiterSize.width * size.width / 667, height: jupiterSize.height * size.height / 375)
        jupiter.addTarget(self, action: #selector(PlanetsViewController.selectedPlanet), for: UIControlEvents.touchUpInside)
        self.content.addSubview(jupiter)
        
        //mars
        let marsImage = UIImage(named: "Mars")
        let marsView = UIImageView(image: marsImage)
        let marsSize = marsView.frame.size
        let mars = UIButton()
        mars.setImage(marsImage, for: UIControlState())
        mars.frame = CGRect(x: 486 * size.width / 667, y: 180 * size.height / 375, width: marsSize.width * size.width / 667, height: marsSize.height * size.height / 375)
        mars.addTarget(self, action: #selector(PlanetsViewController.selectedPlanet), for: UIControlEvents.touchUpInside)
        self.content.addSubview(mars)
        
        //earth
        let earthImage = UIImage(named: "Earth")
        let earthView = UIImageView(image: earthImage)
        let earthSize = earthView.frame.size
        let earth = UIButton()
        earth.setImage(earthImage, for: UIControlState())
        earth.frame = CGRect(x: 514 * size.width / 667, y: 177 * size.height / 375, width: earthSize.width * size.width / 667, height: earthSize.height * size.height / 375)
        earth.addTarget(self, action: #selector(PlanetsViewController.selectedPlanet), for: UIControlEvents.touchUpInside)
        self.content.addSubview(earth)
        
        //venus 
        let venusImage = UIImage(named: "Venus")
        let venusView = UIImageView(image: venusImage)
        let venusSize = venusView.frame.size
        let venus = UIButton()
        venus.setImage(venusImage, for: UIControlState())
        venus.frame = CGRect(x: 545 * size.width / 667, y: 177 * size.height / 375, width: venusSize.width * size.width / 667, height: venusSize.height * size.height / 375)
        venus.addTarget(self, action: #selector(PlanetsViewController.selectedPlanet), for: UIControlEvents.touchUpInside)
        self.content.addSubview(venus)
        
        //mercury
        let mercuryImage = UIImage(named: "Mercury")
        let mercuryView = UIImageView(image: mercuryImage)
        let mercurySize = mercuryView.frame.size
        let mercury = UIButton()
        mercury.setImage(mercuryImage, for: UIControlState())
        mercury.frame = CGRect(x: 578 * size.width / 667, y: 181 * size.height / 375, width: mercurySize.width * size.width / 667, height: mercurySize.height * size.height / 375)
        mercury.addTarget(self, action: #selector(PlanetsViewController.selectedPlanet), for: UIControlEvents.touchUpInside)
        self.content.addSubview(mercury)
        
        //sun
        let sunImage = UIImage(named: "Sun")
        let sunView = UIImageView(image: sunImage)
        let sunSize = sunView.frame.size
        sunView.frame = CGRect(x: 611 * size.width / 667, y: 32.45 * size.height / 375, width: sunSize.width * size.width / 667, height: sunSize.height * size.height / 375)
        self.content.addSubview(sunView)
        

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        updateMinZoomScaleForSize(size: view.bounds.size)
    }
    
    func selectedPlanet(){
        let selectedPlanet = SelectedPlanetViewController()
        present(selectedPlanet, animated: true, completion: nil)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return content
    }
    
    private func updateMinZoomScaleForSize(size: CGSize) {
        let widthScale = size.width / content.bounds.width
        let heightScale = size.height / content.bounds.height
        let minScale = min(widthScale, heightScale)
        
        scroll.minimumZoomScale = minScale
        
        scroll.zoomScale = minScale
    }




}
