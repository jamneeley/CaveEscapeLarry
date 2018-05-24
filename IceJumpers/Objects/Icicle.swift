//
//  Icicle.swift
//  IceJumpers
//
//  Created by James Neeley on 5/23/18.
//  Copyright © 2018 JamesNeeley. All rights reserved.
//

import SpriteKit

class Icicle: SKSpriteNode{
    
    init(name: String, position: CGPoint, linearDamp: CGFloat) {
        let icicleSize = CGSize(width: 20, height: 25)
        super.init(texture: SKTexture(image: #imageLiteral(resourceName: "IcicleImage")), color: Colors.TurqoiseBlue, size: icicleSize)
        setup()
        self.name = name
        self.position = position
        self.physicsBody?.linearDamping = linearDamp
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        physicsBody = SKPhysicsBody(texture: texture!, size: size)
        physicsBody!.categoryBitMask = PhysicsCatagory.Platform
        physicsBody!.collisionBitMask = PhysicsCatagory.Player
        physicsBody!.contactTestBitMask = PhysicsCatagory.None
        physicsBody!.isDynamic = true
        physicsBody!.allowsRotation = false
        zPosition = 3
    }
}
