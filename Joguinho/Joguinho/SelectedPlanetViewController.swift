//
//  SelectedPlanetViewController.swift
//  Joguinho
//
//  Created by Felipe Viberti on 09/11/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import UIKit



class SelectedPlanetViewController: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()
        let size = view.frame.size
        var imageFromCurrentPlanet = UIImageView(image: UIImage(named: currentPlanet.name.rawValue))
        view.backgroundColor = UIColor.init(patternImage: UIImage(named: "background")!)
        for i in 1...8
        {
        let levelImage = UIImage(named: "\(i)")
        let levelView = UIImageView(image: levelImage)
        let levelSize = levelView.frame.size
        let button = UIButton()
        button.setImage(levelImage, for: UIControlState())
        if i <= 4
        {
        button.frame = CGRect(x: 150 + j, y: 30, width: Int(levelSize.width), height: Int(levelSize.height))
        j+=100
        }
        else
        {
        button.frame = CGRect(x: 150 + k, y: 120, width: Int(levelSize.width), height:Int(levelSize.height))
            k+=100
        }
        button.tag = i
        button.addTarget(self, action: #selector(SelectedPlanetViewController.selectedLevel), for: UIControlEvents.touchUpInside)
        view.addSubview(button)
        }
        imageFromCurrentPlanet.frame = CGRect(x: 100, y: 100, width: (imageFromCurrentPlanet.image?.size.width)!, height: (imageFromCurrentPlanet.image?.size.height)!)
        view.addSubview(imageFromCurrentPlanet)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func selectedLevel(_ sender:UIButton)
    {
      //  levelId = sender.tag
        present(GameViewController(), animated: true, completion: nil)
    }
    

    

}
