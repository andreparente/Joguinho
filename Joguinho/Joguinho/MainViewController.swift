//
//  MainViewController.swift
//  Joguinho
//
//  Created by Felipe Viberti on 09/11/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var shoppingButton: UIButton!
    @IBOutlet weak var travelButton: UIButton!
    @IBOutlet weak var configButton: UIButton!
    @IBOutlet weak var standingsButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.init(patternImage: UIImage(named: "background")!)
        
        travelButton.imageView?.animationDuration = 0.8
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func shoppingAction(_ sender: UIButton) {
    }

    @IBAction func travelAction(_ sender: UIButton) {
        
        //deixar bonitinho com animação
        travelButton.imageView?.startAnimating()
        self.performSegue(withIdentifier: "MainToPlanets", sender: self)
    }
    
    @IBAction func configurationAction(_ sender: UIButton) {
    }
    
    @IBAction func standingsAction(_ sender: UIButton) {
    }
    
}
