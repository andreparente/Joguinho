//
//  GameScene.swift
//  Joguinho
//
//  Created by Andre Machado Parente on 10/21/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    
    private var lastUpdateTime : TimeInterval = 0
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    var astronauta:SKSpriteNode?
    
    override func didMove(to view: SKView) {
    astronauta = self.childNode(withName: "astronauta_teste") as? SKSpriteNode

    }
    override func sceneDidLoad() {

        }
    
}
