//
//  SurvivalArtifact.swift
//  Joguinho
//
//  Created by Lucas Ferraço on 08/11/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import Foundation
import SpriteKit



class SurvivalArtifact:Component {
    
    var type: Artifact!
    
    init(type:Artifact) {
        self.type = type
        
        if type.rawValue == "Fuel"
        {
        super.init(imageNamed: "fueldrop")
            self.physicsBody?.allowsRotation = false
            self.physicsBody?.angularDamping = 0
            self.physicsBody?.angularVelocity = 0
        }
        else{
        super.init(imageNamed: "")
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


