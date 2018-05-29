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
    var background: SKSpriteNode
    var instructionGesture: SKSpriteNode
    var escapeMessage: SKLabelNode
    
    var icicles = [Icicle]()
    
    var lastUpdateTime: CFTimeInterval = 0
    let scoreLabel: SKLabelNode
    let youDiedLabel: SKLabelNode
    let menuLabel: SKLabelNode
    
    var touchStartLocation: CGPoint = CGPoint(x: 0, y: 0)
    var playerX: CGFloat = 0
    var playerY: CGFloat = 0
    var playerMoving = false
    var playerWon = false
    var playerLost = false
    var score = 0
    
    //altered at initialization
    var screenSize = CGSize(width: 0, height: 0)
    var ledgeWidth = CGFloat(0)
    var gapWidth = CGFloat(0)
    var icicleWidth = CGFloat(0)
    var icicleHeight = CGFloat(0)
    
    var player: Player?
    
    var powerUps: [PowerUp] = []
    var isPowerActive = false
    var sceneAction = 0
    var importantTimers: [AnyObject] = []
    var timerArray: [AnyObject] = []
    var invincible = false
    var isGameOver = false
    var isBlack = false
    var canJump = false
    var instructionCount = 0
    var numberOfmessages = 0
    
    var isMusicOn = true
    var hitIcicle = false 
    
    
    //MARK: - Init
    override init(size: CGSize) {
        //creatobjects
        leadingEdge = Ground(size: size)
        background = SKSpriteNode(imageNamed: "CaveBackground")
        instructionGesture = SKSpriteNode(imageNamed: "tapGesture")
    
        // leadingEdge = screenSize
        
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
        menuLabel = SKLabelNode(fontNamed: "LLPixel")
        escapeMessage = SKLabelNode(fontNamed:"LLPixel")
        
        super.init(size: size)
        setupSizes(ScreenSize: size)
        setup()
    }
    
    deinit {
        print("game scene deallocated")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    
    func setupSizes(ScreenSize size: CGSize) {
        screenSize = size
        ledgeWidth = size.width * 0.035
        gapWidth = size.width * 0.0075
        icicleWidth = size.width * 0.07
        icicleHeight = size.height * 0.12
    }
    
    func setup() {
        addChild(background)
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        background.size.width = size.width
        background.size.height = size.height
        background.zPosition =  0
        
        backgroundColor = Colors.Jet
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = CGVector(dx: 0, dy: -1)
        
        addChild(leadingEdge)
        leadingEdge.texture = SKTexture(image: #imageLiteral(resourceName: "leadingEdge"))
        leadingEdge.position.x = (leadingEdge.size.width / 2)
        leadingEdge.position.y = (leadingEdge.size.height / 2)
        leadingEdge.zPosition = 1
        
        addChild(trailingEdge)
        trailingEdge.texture = SKTexture(image: #imageLiteral(resourceName: "trailingEdge"))
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
        winPad.position.y = (size.height / 2) 
        winPad.zPosition = 1
        
        resetPlayer()
        createPowerUps(gravity: 1, invincible: 1)
        
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
        scoreLabel.zPosition = 4
        
        addChild(youDiedLabel)
        youDiedLabel.color = .red
        youDiedLabel.text = ""
        youDiedLabel.position.x = size.width / 2
        youDiedLabel.position.y = size.height / 2
        youDiedLabel.fontSize = 50
        youDiedLabel.fontColor = .red
        youDiedLabel.horizontalAlignmentMode = .center
        youDiedLabel.verticalAlignmentMode = .center
        youDiedLabel.zPosition = 4
        
        addChild(menuLabel)
        menuLabel.text = "Menu"
        menuLabel.fontSize = 24
        menuLabel.fontColor = Colors.ShockingPink
        menuLabel.position.x = winPad.position.x - 60
        menuLabel.position.y = (size.height - 10)
        menuLabel.alpha = 99
        menuLabel.horizontalAlignmentMode = .left
        menuLabel.verticalAlignmentMode = .top
        menuLabel.zPosition = 4
        
        addChild(escapeMessage)
        escapeMessage.text = "LARRY! STOP LOUNGING AROUND AND LEAVE THAT CAVE!!!"
        escapeMessage.fontSize = 20
        escapeMessage.fontColor = UIColor.red
        escapeMessage.position.x = size.width / 2
        escapeMessage.position.y = size.height * 0.05
        escapeMessage.isHidden = true
        
        setupJames()
        setupHayden()
        setupFrancisco()
    }
    
    //MASTER VIEW DID LOAD
    override func didMove(to view: SKView) {
        guard let player = player else {return}
        let nodes: [SKSpriteNode] = [leadingEdge, trailingEdge, player, winPad]
        cameraShake(layers: nodes, duration: 3)
        
        if UserDefaults.standard.object(forKey: "isNewUser") as? Bool != false {
            let animationStartTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(startAnimationTimer), userInfo: nil, repeats: true)
            timerArray.append(animationStartTimer)
            
        }
        //music
        if UserDefaults.standard.object(forKey: "isMusicOn") as? Bool == true {
            isMusicOn = true
            print("preference for music is on")
        } else {
            isMusicOn = false
            
            print("preference for music is off")
        }
        if UserDefaults.standard.object(forKey: "isNewUser") as? Bool == false {
        let timerForMessage = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(escapeTimer), userInfo: nil, repeats: true)
        importantTimers.append(timerForMessage)
    }

    }
  
    @objc func startAnimationTimer() {
        if instructionCount < 5 {
            let startAnimation = Timer.scheduledTimer(timeInterval: 0.6, target: self, selector: #selector(animateInstructionGesture), userInfo: nil, repeats: false)
            timerArray.append(startAnimation)
        }
        instructionCount += 1
    }
    
    @objc func animateInstructionGesture() {
        if instructionCount < 3 {
            instructionGesture.position.x = size.width / 2 + size.width * 0.05
            instructionGesture.position.y = size.height / 2
            instructionGesture.size.width = size.width * 0.15
            instructionGesture.size.height = size.width * 0.15
            let endPositionX = size.width / 2
            let endPositionY = size.height / 2 - size.height * 0.15
            addChild(instructionGesture)
            instructionGesture.zPosition = 5
            let slideDown = SKAction.move(to: CGPoint(x: endPositionX, y: endPositionY), duration: 0.4)
            instructionGesture.run(slideDown) {
                self.instructionGesture.removeFromParent()
            }
        } else if instructionCount < 5 {
            instructionGesture.position.x = size.width / 2 - size.width * 0.05
            instructionGesture.position.y = size.height / 2
            instructionGesture.size.width = size.width * 0.15
            instructionGesture.size.height = size.width * 0.15
            let endPositionX = size.width / 2
            let endPositionY = size.height / 2 - size.height * 0.15
            addChild(instructionGesture)
            instructionGesture.zPosition = 5
            let slideDown = SKAction.move(to: CGPoint(x: endPositionX, y: endPositionY), duration: 0.4)
            instructionGesture.run(slideDown) {
                self.instructionGesture.removeFromParent()
            }
        }
    }
    
    func cameraShake(layers: [SKSpriteNode], duration: CGFloat) {
        let amplitudeX:Float = 10
        let amplitudeY:Float = 6
        let numberOfShakes = duration / 0.04
        var actionsArray:[SKAction] = []
        
        for _ in 1...Int(numberOfShakes) {
            let moveX = Float(arc4random_uniform(UInt32(amplitudeX))) - amplitudeX / 2
            let moveY = Float(arc4random_uniform(UInt32(amplitudeY))) - amplitudeY / 2
            
            let shakeAction = SKAction.moveBy(x: CGFloat(moveX), y: CGFloat(moveY), duration: 0.02)
            shakeAction.timingMode = SKActionTimingMode.easeOut
            actionsArray.append(shakeAction)
            actionsArray.append(shakeAction.reversed())
        }
        
        let actionSeq = SKAction.sequence(actionsArray)
        for layer in layers {
            layer.run(actionSeq)
        }
        let canJumpTimer = Timer.scheduledTimer(timeInterval: TimeInterval(duration + 1.6), target: self, selector: #selector(setCanJump), userInfo: nil, repeats: false)
        timerArray.append(canJumpTimer)
    }
    
    @objc func setCanJump(){
        canJump = true
    }
    
    
    //MASTER UPDATE PER FRAME
    override func update(_ currentTime: TimeInterval) {
        
        if isGameOver == true {
            print("Game Over!")
            // This is all for the cleanup of the scene so it can deinit
            gameSceneCleanUp()
            self.removeAllActions()
            self.removeAllChildren()
            self.removeFromParent()
            let newGameScene = GameScene(size: (view?.frame.size)!)
            newGameScene.scaleMode = self.scaleMode
            let animation = SKTransition.fade(withDuration: 1.0)
            self.view?.presentScene(newGameScene, transition: animation)
        }
        updateJames()
        updateHayden()
        updateFrancisco()
    }
    
    func gameSceneCleanUp() {
        backgroundColor = .black
        for child in children {
            child.removeFromParent()
        }
        
        for timer in timerArray {
            timer.invalidate()
        }
        for timer in importantTimers {
            timer.invalidate()
        }
        
        for icicle in icicles{
            guard let index = icicles.index(of: icicle) else {return}
            icicles.remove(at: index)
        }
        self.removeAllActions()
        self.removeAllChildren()
        self.removeFromParent()
    }
    
    @objc func escapeTimer() {
        if numberOfmessages < 1 {
            let escapeMessageTimer = Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(showEscapeMessage), userInfo: nil, repeats: false)
            timerArray.append(escapeMessageTimer)
        } else {
            escapeMessage.isHidden = true
        }
}
    @objc func showEscapeMessage () {
       if escapeMessage.isHidden == true {
            escapeMessage.isHidden = false
            numberOfmessages += 1
        }

    }
}

 
