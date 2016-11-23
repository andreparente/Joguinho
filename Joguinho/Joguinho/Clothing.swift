//
//  File.swift
//  Joguinho
//
//  Created by Andre Machado Parente on 10/21/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import Foundation

class Clothing: Item {
    
    var clothingType: ClothingType!
    init(clothingType:ClothingType) {
        self.clothingType = clothingType
        
        switch clothingType.rawValue {
        case "Helmet":
        super.init(price: 5, imageNamed: "Helmet")
        case "UpperBody":
         super.init(price: 5, imageNamed: "UpperBody")
         case "LowerBody":
         super.init(price: 5, imageNamed: "LowerBody")
         case "Boot":
         super.init(price: 5, imageNamed: "Boot")
         default:
         super.init(price: 0, imageNamed: nil)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

enum ClothingType: String {
    
    case Helmet = "Helmet"
    case UpperBody = "UpperBody"
    case LowerBody = "LowerBody"
    case Boot = "Boot"
}
