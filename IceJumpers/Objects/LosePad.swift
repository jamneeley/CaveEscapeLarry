//
//  LosePad.swift
//  IceJumpers
//
//  Created by James Neeley on 5/23/18.
//  Copyright © 2018 JamesNeeley. All rights reserved.
//

import SpriteKit

class LosePad: SKSpriteNode{
    
    init(size: CGSize) {
        super.init(texture: nil, color: .red, size: CGSize(width: size.width - ((size.width * 0.035) * 2), height: 10))
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody!.categoryBitMask = PhysicsCatagory.LoosePad
        physicsBody!.collisionBitMask = PhysicsCatagory.None
        physicsBody!.contactTestBitMask = PhysicsCatagory.Player
        physicsBody!.isDynamic = false
    }
}
