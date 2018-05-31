//
//  Player.swift
//  IceJumpers
//
//  Created by James Neeley on 5/23/18.
//  Copyright © 2018 JamesNeeley. All rights reserved.
//

import SpriteKit

class Player: SKSpriteNode{
    
    init(color: UIColor, size: CGSize) {
        super.init(texture: nil, color: color, size: size)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody!.categoryBitMask = PhysicsCatagory.Player
        physicsBody!.collisionBitMask = PhysicsCatagory.Platform | PhysicsCatagory.Icicle
        physicsBody!.contactTestBitMask = PhysicsCatagory.WinPad | PhysicsCatagory.LoosePad | PhysicsCatagory.PowerUp | PhysicsCatagory.Icicle
        physicsBody!.isDynamic = true
    }
}
