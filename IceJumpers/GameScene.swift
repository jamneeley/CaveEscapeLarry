//
//  GameScene.swift
//  iceJumper
//
//  Created by James Neeley on 5/21/18.
//  Copyright © 2018 JamesNeeley. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    //MARK: - Properties
    var leadingEdge: Ground
    var trailingEdge: Ground
    var winPad: WinPad
    var losePad: LosePad
    var leadingWall: Wall
    var trailingWall: Wall
    var ceiling: Wall
    
    var icicles = [Icicle]()
    
    var lastUpdateTime: CFTimeInterval = 0
    let scoreLabel: SKLabelNode
    let youDiedLabel: SKLabelNode
    
    var touchStartLocation: CGPoint = CGPoint(x: 0, y: 0)
    var playerX: CGFloat = 0
    var playerY: CGFloat = 0
    var playerMoving = false
    var playerWon = false
    var playerLost = false
    var score = 0
    var player: Player?
    
    
    //MARK: - Init
    override init(size: CGSize) {
        //creatobjects
        leadingEdge = Ground(size: size)

        trailingEdge = Ground(size: size)
        winPad = WinPad(size: size)
        losePad = LosePad(size: size)
        
        let wallSize = CGSize(width: 5, height: size.height)
        let ceilingSize = CGSize(width: size.width, height: 5)
        leadingWall = Wall(size: wallSize)
        trailingWall = Wall(size: wallSize)
        ceiling = Wall(size: ceilingSize)
        
        scoreLabel = SKLabelNode(fontNamed: "LLPixel")
        youDiedLabel = SKLabelNode(fontNamed: "LLPixel")
        
        super.init(size: size)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    
    func setup() {
        
        backgroundColor = Colors.Jet
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)
        
        addChild(leadingEdge)
        leadingEdge.position.x = (leadingEdge.size.width / 2)
        leadingEdge.position.y = (leadingEdge.size.height / 2)
        leadingEdge.zPosition = 1
        
        
        addChild(trailingEdge)
        trailingEdge.position.x = (size.width) - (trailingEdge.size.width / 2)
        trailingEdge.position.y = (trailingEdge.size.height / 2)
        trailingEdge.zPosition = 1
        
        addChild(leadingWall)
        leadingWall.position.x = -(leadingWall.size.width / 2)
        leadingWall.position.y = (size.height / 2)
        leadingWall.zPosition = 1
        
        addChild(trailingWall)
        trailingWall.position.x = size.width + (trailingWall.size.width / 2)
        trailingWall.position.y = (size.height / 2)
        trailingWall.zPosition = 1
        
        addChild(ceiling)
        ceiling.position.x = (size.width / 2)
        ceiling.position.y = size.height + (ceiling.size.height / 2)

        addChild(losePad)
        losePad.position.x = (size.width / 2)
        losePad.position.y = -(losePad.size.height / 2)
        losePad.zPosition = 2
        
        addChild(winPad)
        winPad.position.x = (size.width) - (winPad.size.width / 2)
        winPad.position.y = (size.height / 2) + (winPad.size.height / 2)
        winPad.zPosition = 1
        
        resetPlayer()
    
        addChild(scoreLabel)
        scoreLabel.text = "Score: \(score)"
        scoreLabel.fontSize = 24
        scoreLabel.fontColor = Colors.ShockingPink
        print("\(size.width)")
        print("\(size.height)")
        scoreLabel.position.x = 10
        scoreLabel.position.y = (size.height - 10)
        scoreLabel.alpha = 99
        scoreLabel.horizontalAlignmentMode = .left
        scoreLabel.verticalAlignmentMode = .top
        
        addChild(youDiedLabel)
        youDiedLabel.color = .red
        youDiedLabel.text = ""
        youDiedLabel.position.x = size.width / 2
        youDiedLabel.position.y = size.height / 2
        youDiedLabel.fontSize = 50
        youDiedLabel.fontColor = .red
        youDiedLabel.horizontalAlignmentMode = .center
        youDiedLabel.verticalAlignmentMode = .center
        
        
        //        for icicle in icicles {
        //            addChild(icicle)
        //        }

        
        setupJames()
        setupHayden()
        setupFrancisco()
    }

    //MASTER VIEW DID LOAD
    override func didMove(to view: SKView) {

    }
    
    //MASTER UPDATE PER FRAME
    override func update(_ currentTime: TimeInterval) {
        updateJames()
        updateHayden()
        updateFrancisco()
    }
}
