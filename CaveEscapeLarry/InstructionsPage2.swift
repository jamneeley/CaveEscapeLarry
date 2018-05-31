//
//  InstructionsPage2.swift
//  CaveEscapeLarry
//
//  Created by Hayden Murdock on 5/31/18.
//  Copyright © 2018 JamesNeeley. All rights reserved.
//

import Foundation
import SpriteKit

class InstructionsPage2: SKScene {
    
    var text1: SKLabelNode
    var larry: Player?
    var icicle: Icicle
    var winingLedge: SKSpriteNode
    var flagPole: SKSpriteNode
    
    
    override init(size: CGSize) {
        
        text1 = SKLabelNode(fontNamed: "LLPixel")
        larry = Player(color: Colors.TurqoiseBlue, size: CGSize(width: 25, height: 25))
        icicle = Icicle(name: "icicle 1", position: CGPoint(x: size.width / 2, y: size.height + 400), linearDamp: (9), size: CGSize(width: 50, height: 100))
        winingLedge = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "trailingEdge")))
        flagPole = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "flagpole")), size: CGSize(width: size.width * 0.06, height: size.height * 0.1))
        
        super.init(size: size)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("instructionPage Deallocated")
    }
    
    func setup () {
        backgroundColor = Colors.Jet
        larry?.physicsBody?.affectedByGravity = false
        addChild(text1)
        text1.text = "Larry needs to get to the flag, WATCH OUT FOR ICICLES"
        text1.fontSize = 20
        text1.fontColor = Colors.PlumpPurple
        text1.horizontalAlignmentMode = .center
        text1.verticalAlignmentMode = .top
        text1.position.x = size.width / 2
        text1.position.y = size.height / 2 - 125
        text1.zPosition = 10
        text1.alpha = 99
        
        
        addChild(winingLedge)
        winingLedge.position.x = (size.width) - (winingLedge.size.width / 2)
        winingLedge.position.y = (winingLedge.size.height / 2)
        winingLedge.zPosition = 1
        
        addChild(flagPole)
        flagPole.position.x = size.width - flagPole.size.width / 2
        flagPole.position.y = winingLedge.position.y * 2 + flagPole.size.height / 2
        flagPole.zPosition = 2
        
        
        
        addChild(icicle)

        
    }
    
    func animateLarry() {
        guard let larry = larry else {return}
        var yActionArray: [SKAction] = []
        addChild(larry)
        larry.zPosition = 1
        larry.position.x = -(size.width / 2)
        
        larry.position.y = size.height / 2 + (size.height * 0.25)
        let xAnimation: SKAction = SKAction.move(by: CGVector(dx: size.width * 2, dy: 0), duration: 6)
        let yAnimation: SKAction = SKAction.move(by: CGVector(dx: 0, dy: 20), duration: 0.2)
        yAnimation.timingMode = .easeIn
        let yreversed = yAnimation.reversed()
        yreversed.timingMode = .easeOut
        for _ in 0..<12 {
            yActionArray.append(yAnimation)
            yActionArray.append(yreversed)
        }
        
        let sequence = SKAction.sequence(yActionArray)
        larry.run(xAnimation)
        larry.run(sequence)
    }
    
    
    override func didMove(to view: SKView) {
        animateLarry()
    }
    override func update(_ currentTime: TimeInterval) {
        guard let larry = larry else {return}
        if larry.position.x >= size.width {
            larry.removeAllActions()
            larry.removeFromParent()
            animateLarry()
        }
    }
    
    
    func didBegin(_ contact: SKPhysicsContact) {
        let collision = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        if collision == PhysicsCatagory.Player | PhysicsCatagory.Icicle {
            print("they collided")
            
        }
    }
}
