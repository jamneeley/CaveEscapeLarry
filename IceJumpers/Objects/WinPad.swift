//
//  WinPad.swift
//  IceJumpers
//
//  Created by James Neeley on 5/23/18.
//  Copyright © 2018 JamesNeeley. All rights reserved.
//

import SpriteKit

class WinPad: SKSpriteNode{
    
    init(size: CGSize) {
        super.init(texture: nil, color: Colors.PlumpPurple, size: CGSize(width: size.width * 0.035, height: 5))
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody!.categoryBitMask = PhysicsCatagory.WinPad
        physicsBody!.collisionBitMask = PhysicsCatagory.None
        physicsBody!.contactTestBitMask = PhysicsCatagory.Player
        physicsBody!.isDynamic = false
    }
}





