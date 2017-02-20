//
//  Piece.swift
//  Joguinho
//
//  Created by Andre Machado Parente on 10/21/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import Foundation


class Piece: Item {
    
    var pieceType: PieceType!
    
    init(pieceType:PieceType) {
        self.pieceType = pieceType
        
        switch pieceType.rawValue
        {
        case "Wing":
            super.init(price: 5, imageNamed: "Wing")
        case "Tank":
            super.init(price: 5, imageNamed: "Tank")
        case "Engine":
            super.init(price: 5, imageNamed: "Engine")
        default:
            super.init(price: 0, imageNamed: nil)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


