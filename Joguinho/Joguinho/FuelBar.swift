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
    
    
    var max: Int!
    var min: Int! = 0
    var qtd: Int!
    
    func decrease(qtd: CGFloat) {
        self.size.width -= 2
        self.position = CGPoint(x: (screenSize.width/2) - 60 - qtd, y: 7*screenSize.height/8)

    }
    
    func increase(qtd: Int) {
        
    }
    
    init(image: String?) {
        super.init(imageNamed: image)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
