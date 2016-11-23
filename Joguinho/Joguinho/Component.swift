//
//  Component.swift
//  Joguinho
//
//  Created by Felipe Viberti on 09/11/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import Foundation
import SpriteKit

class Component:SKSpriteNode
{
    var imageNamed:String?
    init(imageNamed:String?) {
        self.imageNamed = imageNamed
        let texture = SKTexture(imageNamed: imageNamed!)
        super.init(texture: texture, color: UIColor.blue, size: texture.size())
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
