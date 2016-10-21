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
}

enum PieceType: String {
    
    case Wing = "Wing"
    case Tank = "Tank"
    //mais partes please
}
