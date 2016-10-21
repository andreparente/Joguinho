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
    
}

enum ClothingType: String {
    
    case Helmet = "Helmet"
    case UpperBody = "UpperBody"
    case LowerBody = "LowerBody"
    case Boot = "Boot"
}
