//
//  FuelBar.swift
//  Joguinho
//
//  Created by Andre Machado Parente on 16/11/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import Foundation
import UIKit

class FuelBar: Component {
    
    var fuelSize: CGFloat!
    var pivo = screenSize.width/4 - 10
    var max: Int!
    var min: Int! = 0
    var qtd: Int!

    
    func change(increase newValue: Int!) {

        fuelSize = fuelSize + CGFloat(newValue)
        self.size.width = fuelSize
        self.position = CGPoint(x: pivo + (fuelSize/2), y: 7*screenSize.height/8)
        self.qtd = newValue

    }
    
    init(image: String?) {
        
        super.init(imageNamed: image)
        self.qtd = 100
        fuelSize = screenSize.width/2
        //self.size.width = fuelSize
        self.position = CGPoint(x: pivo + (fuelSize/2), y: 7*screenSize.height/8)
        
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
