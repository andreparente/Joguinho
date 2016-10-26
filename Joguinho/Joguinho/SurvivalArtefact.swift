//
//  SurvivalArtefact.swift
//  Joguinho
//
//  Created by Andre Machado Parente on 10/21/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import Foundation


class SurvivalArtefact {
    
    var type: ArtefactType!
    var image: NSData! //ou usamos string com o nome da imagem?
}

enum ArtefactType: String {
    
    case Oxygen = "Oxygen"
    case Fuel = "Fuel"
}
