//
//  PowerUp.swift
//  IceJumpers
//
//  Created by James Neeley on 5/24/18.
//  Copyright © 2018 JamesNeeley. All rights reserved.
//

import SpriteKit

class PowerUp: SKSpriteNode{
    
    init(name: String, color: UIColor) {
        super.init(texture: nil, color: color, size: CGSize(width: 10, height: 10))
        setup()
        self.name = name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody!.categoryBitMask = PhysicsCatagory.PowerUp
        physicsBody!.collisionBitMask = PhysicsCatagory.None
        physicsBody!.contactTestBitMask = PhysicsCatagory.Player
        physicsBody!.isDynamic = false
        zPosition = 2
    }
}
