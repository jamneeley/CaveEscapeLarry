//
//  InstructionsPage.swift
//  CaveEscapeLarry
//
//  Created by Hayden Murdock on 5/31/18.
//  Copyright © 2018 JamesNeeley. All rights reserved.
//

import Foundation
import SpriteKit

class InstructionsPage: SKScene {
    
    //properties
    var text1: SKLabelNode
    var text2: SKLabelNode
    var text3: SKLabelNode
    var nextLabel: SKLabelNode
    var larry: SKSpriteNode
    var timerArray: [AnyObject] = []
    
    
    
    override init(size: CGSize) {
        
        text1 = SKLabelNode(fontNamed: "LLPixel")
        text2 = SKLabelNode(fontNamed: "LLPixel")
        text3 = SKLabelNode(fontNamed: "LLPixel")
        nextLabel = SKLabelNode(fontNamed: "LLPixel")
        larry = SKSpriteNode(color: Colors.TurqoiseBlue, size: CGSize(width: 25, height: 25))
        
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
        
        addChild(text1)
        text1.text = "This little guy is Larry."
        text1.fontSize = 25
        text1.fontColor = Colors.PlumpPurple
        text1.horizontalAlignmentMode = .center
        text1.verticalAlignmentMode = .top
        text1.position.x = size.width / 2
        text1.position.y = size.height / 2 + 100
        text1.zPosition = 10
        text1.alpha = 99
        
        addChild(text2)
        text2.text = "Larry is located on the left side of your screen"
        text2.fontSize = 25
        text2.fontColor = Colors.PlumpPurple
        text2.horizontalAlignmentMode = .center
        text2.verticalAlignmentMode = .top
        text2.position.x = size.width / 2
        text2.position.y = size.height / 2 - 100
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
        
        
    }
    
    func animateLarry() {
        var yActionArray: [SKAction] = []
        addChild(larry)
        larry.zPosition = 1
        larry.position.x = -(size.width * 0.1)
        
        larry.position.y = size.height / 2 - (size.height * 0.07)
        let xAnimation: SKAction = SKAction.move(by: CGVector(dx: size.width * 2, dy: 0), duration: 4)
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
        
        let textTimer  = Timer.scheduledTimer(timeInterval: TimeInterval(2.5), target: self, selector: #selector(showtext), userInfo: nil, repeats: false)
        timerArray.append(textTimer)
    }
    
    override func update(_ currentTime: TimeInterval) {
        if larry.position.x >= size.width {
            larry.removeAllActions()
            larry.removeFromParent()
            animateLarry()
        }
    }
    
    @objc func showtext() {
        text2.isHidden = false
        nextLabel.isHidden = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches  {
            let location = touch.location(in: self)
            
            if nextLabel.contains(location  ) {
                for timer in timerArray {
                    timer.invalidate()
                }
                timerArray.removeAll()
                if let skview = self.view {
                    let leftInset = skview.safeAreaInsets.left
                    let rightInset = skview.safeAreaInsets.right
                    let topInset = skview.safeAreaInsets.top
                    let bottomInset = skview.safeAreaInsets.bottom
                    let width = skview.frame.width - (leftInset + rightInset)
                    let height = skview.frame.height - (topInset + bottomInset)
                    let safeView = CGSize(width: width, height: height)
                    let instructionsPage = InstructionsPage2(size: safeView)
                    instructionsPage.scaleMode = .aspectFit
                    let animation = SKTransition.crossFade(withDuration: 1)
                    self.view?.presentScene(instructionsPage, transition: animation)
                }
            }
        }
    }
}
