//
//  SurvivalArtifact.swift
//  Joguinho
//
//  Created by Lucas Ferraço on 08/11/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import Foundation
import SpriteKit

enum Artifact:String {
    case oxygen = "Oxygen"
    case fuel = "Fuel"
}

class SurvivalArtifact:Component {
    
    var type: Artifact!
    
    init(type:Artifact) {
        self.type = type
        if type.rawValue == "Fuel"
        {
        super.init(imageNamed: "fueldrop")
        }
        else{
        super.init(imageNamed: "")
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


