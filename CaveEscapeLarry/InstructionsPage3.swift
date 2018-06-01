//
//  InstructionsPage3.swift
//  CaveEscapeLarry
//
//  Created by Hayden Murdock on 5/31/18.
//  Copyright © 2018 JamesNeeley. All rights reserved.
//

import Foundation
import SpriteKit

class InstructionsPage3: SKScene {
    
    let text1: SKLabelNode
    let text2: SKLabelNode
    let text3: SKLabelNode
    let nextLabel: SKLabelNode
    var touchStartLocation: CGPoint = CGPoint(x: 0, y: 0)
    
    let larry:Player?
    
    let leadingWall: Wall
    let trailingWall: Wall
    let ground: Wall
    let ceiling: Wall

    override init(size: CGSize) {
        
        text1 = SKLabelNode(fontNamed: "LLPixel")
        text2 = SKLabelNode(fontNamed: "LLPixel")
        text3 = SKLabelNode(fontNamed: "LLPixel")
        nextLabel = SKLabelNode(fontNamed: "LLPixel")
        
        let wallSize = CGSize(width: 5, height: size.height)
        let ceilingSize = CGSize(width: size.width, height: 5)
        
        leadingWall = Wall(size: wallSize)
        trailingWall = Wall(size: wallSize)
        
        ground = Wall(size: ceilingSize)
        ceiling = Wall(size: ceilingSize)
        larry = Player(color: Colors.TurqoiseBlue, size: CGSize(width: 25, height: 25))
        super.init(size: size)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("instructionPage Deallocated")
    }
    
    override func didMove(to view: SKView) {
    
    }
    
    func setup() {
        backgroundColor = Colors.Jet
        
        addChild(text1)
        text1.text = "Larry works like a spring"
        text1.fontSize = 30
        text1.fontColor = Colors.PlumpPurple
        text1.horizontalAlignmentMode = .center
        text1.verticalAlignmentMode = .top
        text1.position.x = size.width / 2
        text1.position.y = size.height - 40
        text1.zPosition = 10
        text1.alpha = 99
        
        addChild(text2)
        text2.text = "Pull your thumb or finger the opposite direction to move Larry"
        text2.fontSize = 20
        text2.fontColor = Colors.PlumpPurple
        text2.horizontalAlignmentMode = .center
        text2.verticalAlignmentMode = .top
        text2.position.x = size.width / 2
        text2.position.y = text1.position.y - 25
        text2.zPosition = 10
        text2.alpha = 99
        
        addChild(text3)
        text3.text = "Try it out"
        text3.fontSize = 20
        text3.fontColor = Colors.PlumpPurple
        text3.horizontalAlignmentMode = .center
        text3.verticalAlignmentMode = .top
        text3.position.x = size.width / 2
        text3.position.y = text2.position.y - 25
        text3.zPosition = 10
        text3.alpha = 99
        
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
        
        addChild(trailingWall)
        trailingWall.color = .yellow
        trailingWall.position.x = size.width
        trailingWall.position.y = (size.height / 2)
        trailingWall.zPosition = 1
        
        addChild(leadingWall)
        leadingWall.color = .yellow
        leadingWall.position.x = 0
        leadingWall.position.y = (size.height / 2)
        leadingWall.zPosition = 1
        
        
        addChild(ceiling)
        ceiling.color = .yellow
        ceiling.position.x = size.width / 2
        ceiling.position.y = size.height
        
        addChild(ground)
        ground.color = .yellow
        ground.position.x = size.width / 2
        ground.position.y = 0
        guard let larry = larry else {return}
        addChild(larry)
        larry.position.x = size.width / 2
        larry.position.y = size.height
        larry.zPosition = 5
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches  {
            let location = touch.location(in: self)
            nextLabel.isHidden = false
            touchStartLocation = location
            
            if nextLabel.contains(location) {
                if let skview = self.view {
                    let leftInset = skview.safeAreaInsets.left
                    let rightInset = skview.safeAreaInsets.right
                    let topInset = skview.safeAreaInsets.top
                    let bottomInset = skview.safeAreaInsets.bottom
                    let width = skview.frame.width - (leftInset + rightInset)
                    let height = skview.frame.height - (topInset + bottomInset)
                    let safeView = CGSize(width: width, height: height)
                    let instructionsPage = GameMenu(size: safeView)
                    instructionsPage.scaleMode = .aspectFit
                    let animation = SKTransition.crossFade(withDuration: 1)
                    self.view?.presentScene(instructionsPage, transition: animation)
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let angle = findAngle(StartPoint: touchStartLocation, EndPoint: location)
            SwitchAngleToVectorJump(Angle: angle)
        }
    }
    
    //find angle of finger drag
    func findAngle(StartPoint: CGPoint, EndPoint: CGPoint) -> CGFloat{
        let radians = atan2(StartPoint.y - EndPoint.y, StartPoint.x - EndPoint.x)
        let degree = radians * 180.0 / CGFloat.pi
        return degree
    }
    
    
    func SwitchAngleToVectorJump(Angle angle: CGFloat) {
        switch angle {
        case 160...180:
            jumpPlayer(dx: -6, dy: 4)
        case 140...159:
            jumpPlayer(dx: -4.5, dy: 8)
        case 120...139:
            jumpPlayer(dx: -3, dy: 12)
        case 100...119:
            jumpPlayer(dx: -1.5, dy: 16)
        case 80...99:
            jumpPlayer(dx: 0, dy: 20)
        case 60...79:
            jumpPlayer(dx: 1.5, dy: 16)
        case 40...59:
            jumpPlayer(dx: 3, dy: 12)
        case 20...39:
            jumpPlayer(dx: 4.5, dy: 8)
        case 0...19:
            jumpPlayer(dx: 6, dy: 4)
        default:
            return
        }
    }
    
    func jumpPlayer(dx: CGFloat, dy: CGFloat) {
        guard let larry = larry else {return}
            larry.physicsBody?.applyImpulse(CGVector(dx: dx, dy: dy))
    }
    
    
}

