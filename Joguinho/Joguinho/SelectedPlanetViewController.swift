//
//  SelectedPlanetViewController.swift
//  Joguinho
//
//  Created by Felipe Viberti on 09/11/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import UIKit

class SelectedPlanetViewController: UIViewController {

    var levelNumber:Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        let size = view.frame.size
         view.backgroundColor = UIColor.init(patternImage: UIImage(named: "background")!)
        for i in 1...8
        {
        let levelImage = UIImage(named: "\(i)")
        let levelView = UIImageView(image: levelImage)
        let levelSize = levelView.frame.size
        let neptune = UIButton()
        neptune.setImage(levelImage, for: UIControlState())
        if i <= 4
        {
        neptune.frame = CGRect(x: 150 + j, y: 30, width: Int(levelSize.width), height: Int(levelSize.height))
        j+=100
        }
        else
        {
        neptune.frame = CGRect(x: 150 + k, y: 120, width: Int(levelSize.width), height:Int(levelSize.height))
            k+=100
        }
        neptune.addTarget(self, action: #selector(SelectedPlanetViewController.selectedLevel), for: UIControlEvents.touchUpInside)
        
        view.addSubview(neptune)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func selectedLevel(_ sender:UIButton)
    {
        performSegue(withIdentifier: "SelectedPlanetToGameScene", sender: self)
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVc = segue.destination as! GameViewController
    }
    

}
