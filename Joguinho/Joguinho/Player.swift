//
//  Player.swift
//  Joguinho
//
//  Created by Andre Machado Parente on 10/21/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import Foundation

class Player {
    
    var coinsBalance: Int!
    var lastLevel: Int!
    var spaceShip: Spaceship!
    var astronaut: Astronaut!
    var itens: [Item]!
    
    init(coinsBalance:Int,lastLevel:Int,spaceShip:Spaceship?,astronaut:Astronaut?,itens:[Item]?) {
        self.coinsBalance = coinsBalance
        self.lastLevel = lastLevel
        self.spaceShip = spaceShip
        self.astronaut = astronaut
        self.itens = itens
    }
    func buyItem() {
        
    }
    
    func buyCash() {
        
    }
    
}
