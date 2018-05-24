//
//  Wall.swift
//  IceJumpers
//
//  Created by James Neeley on 5/23/18.
//  Copyright © 2018 JamesNeeley. All rights reserved.
//

import SpriteKit

class Wall: SKSpriteNode{
    
    init(size: CGSize) {
        super.init(texture: nil, color: Colors.CreameBlue, size: CGSize(width: size.width, height: size.height))
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody!.categoryBitMask = PhysicsCatagory.Platform
        physicsBody!.collisionBitMask = PhysicsCatagory.Player
        physicsBody!.contactTestBitMask = PhysicsCatagory.None
        physicsBody!.isDynamic = false
    }
}
