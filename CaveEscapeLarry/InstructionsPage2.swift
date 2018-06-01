//
//  InstructionsPage2.swift
//  CaveEscapeLarry
//
//  Created by Hayden Murdock on 5/31/18.
//  Copyright © 2018 JamesNeeley. All rights reserved.
//

import Foundation
import SpriteKit

class InstructionsPage2: SKScene, SKPhysicsContactDelegate {
    
    var text1: SKLabelNode
    var text2: SKLabelNode
    var nextLabel: SKLabelNode
    var larry: Player?
    var winingLedge: SKSpriteNode
    var flagPole: SKSpriteNode
    var numberOfCollisions = 0
    let sound1 = SKAction.playSoundFileNamed("DeathSound", waitForCompletion: false)
    
    override init(size: CGSize) {
        
        text1 = SKLabelNode(fontNamed: "LLPixel")
        text2 = SKLabelNode(fontNamed: "LLPixel")
        nextLabel = SKLabelNode(fontNamed: "LLPixel")
        
        larry = Player(color: Colors.TurqoiseBlue, size: CGSize(width: 25, height: 25))
       
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
        physicsWorld.contactDelegate = self
        addChild(text1)
        text1.text = "Get Larry to the flag"
        text1.fontSize = 20
        text1.fontColor = Colors.PlumpPurple
        text1.horizontalAlignmentMode = .center
        text1.verticalAlignmentMode = .top
        text1.position.x = size.width / 2
        text1.position.y = size.height / 2 - 125
        text1.zPosition = 10
        text1.alpha = 99
        
        addChild(text2)
        
        text2.text = "WATCH OUT FOR ICICLES"
        text2.fontSize = 40
        text2.fontColor = Colors.PlumpPurple
        text2.horizontalAlignmentMode = .center
        text2.verticalAlignmentMode = .top
        text2.position.x = size.width / 2
        text2.position.y = size.height / 2
        text2.zPosition = 10
        text2.alpha = 99
        text2.isHidden = true
        
        addChild(nextLabel)
        nextLabel.text = "Next"
        nextLabel.fontSize = 25
        nextLabel.fontColor = UIColor.red
        nextLabel.horizontalAlignmentMode = .center
        nextLabel.verticalAlignmentMode = .top
        nextLabel.position.x = size.width - 75
        nextLabel.position.y = size.height - 10
        nextLabel.zPosition = 10
        nextLabel.alpha = 99
        nextLabel.isHidden = true
        
        addChild(winingLedge)
        winingLedge.position.x = (size.width) - (winingLedge.size.width / 2)
        winingLedge.position.y = (winingLedge.size.height / 2)
        winingLedge.zPosition = 1
        
        addChild(flagPole)
        flagPole.position.x = size.width - flagPole.size.width / 2
        flagPole.position.y = winingLedge.position.y * 2 + flagPole.size.height / 2
        flagPole.zPosition = 2
        
        let icicle1 = Icicle(name: "icicle 1", position: CGPoint(x: size.width / 2, y: size.height + 400), linearDamp: (9), size: CGSize(width: 50, height: 100))
        
        icicle1.physicsBody?.isDynamic = true
        

        addChild(icicle1)
    }
    
    func animateLarry() {
        guard let larry = larry else {return}
        var yActionArray: [SKAction] = []
        addChild(larry)
        larry.zPosition = 3
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
        if larry.position.x >= size.width * 0.63 || larry.position.y > size.height {
            larry.removeAllActions()
            larry.removeFromParent()
            text2.isHidden = false
            text1.isHidden = true
            nextLabel.isHidden = false
            
        }
        if numberOfCollisions == 1 {
            run(sound1)
            numberOfCollisions += 1
        }
    }
    
    
    func didBegin(_ contact: SKPhysicsContact) {
    
        let collision = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        if collision == PhysicsCatagory.Player | PhysicsCatagory.Icicle && numberOfCollisions == 0{
            print("they collided")
            larry?.color = .red
            larry?.physicsBody?.affectedByGravity = true
            numberOfCollisions += 1
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches  {
            
    let location = touch.location(in: self)
            
    if nextLabel.contains(location) {
        
        if let skview = self.view {
            let leftInset = skview.safeAreaInsets.left
            let rightInset = skview.safeAreaInsets.right
            let topInset = skview.safeAreaInsets.top
            let bottomInset = skview.safeAreaInsets.bottom
            let width = skview.frame.width - (leftInset + rightInset)
            let height = skview.frame.height - (topInset + bottomInset)
            let safeView = CGSize(width: width, height: height)
            let instructionsPage = InstructionsPage3(size: safeView)
            instructionsPage.scaleMode = .aspectFit
            let animation = SKTransition.crossFade(withDuration: 1)
            self.view?.presentScene(instructionsPage, transition: animation)
        }
            }
        }
    }
}
