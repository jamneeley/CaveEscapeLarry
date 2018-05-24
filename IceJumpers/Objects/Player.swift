//
//  Player.swift
//  IceJumpers
//
//  Created by James Neeley on 5/23/18.
//  Copyright © 2018 JamesNeeley. All rights reserved.
//

import SpriteKit

class Player: SKSpriteNode{
    
    init(color: UIColor) {
        super.init(texture: nil, color: color, size: CGSize(width: 7, height: 7))
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody!.categoryBitMask = PhysicsCatagory.Player
        physicsBody!.collisionBitMask = PhysicsCatagory.Platform
        physicsBody!.contactTestBitMask = PhysicsCatagory.WinPad | PhysicsCatagory.LoosePad
        physicsBody!.isDynamic = true
    }
}
