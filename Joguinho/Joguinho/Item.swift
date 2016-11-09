//
//  Item.swift
//  Joguinho
//
//  Created by Andre Machado Parente on 10/21/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import Foundation


class Item:Component {
    
    var price: Double!
    
    init(price: Double,imageNamed:String?) {
        super.init(imageNamed: imageNamed)
        self.price = price
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
