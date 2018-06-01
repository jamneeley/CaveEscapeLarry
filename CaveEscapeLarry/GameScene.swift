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
    
    //Objects
    
    var leadingEdge: Ground
    var trailingEdge: Ground
    var winPad: WinPad
    var losePad: LosePad
    var leadingWall: Wall
    var trailingWall: Wall
    var ceiling: Wall
    var background: SKSpriteNode
    var instructionGesture: SKSpriteNode
    var flagPole: SKSpriteNode
    
    //moving objects
    var player: Player?
    var icicles = [Icicle]()
    
    //Labels
    let scoreLabel: SKLabelNode
    let youDiedLabel: SKLabelNode
    let menuLabel: SKLabelNode
    var instructLarryLabel: SKLabelNode
    var larryLabel: SKLabelNode
    var powerUpTimeRemainingLabel: SKLabelNode
    
    //SIZES - altered at initialization
    var screenSize = CGSize(width: 0, height: 0)
    var ledgeWidth = CGFloat(0)
    var gapWidth = CGFloat(0)
    var icicleWidth = CGFloat(0)
    var icicleHeight = CGFloat(0)
    
    //timers
    var importantTimers: [AnyObject] = []
    var timerArray: [AnyObject] = []
    var messageTimers: [AnyObject] = []
    var countDownTimers: [AnyObject] = []
    //misc
    
    var touchStartLocation: CGPoint = CGPoint(x: 0, y: 0)
    var playerWon = false
    var playerLost = false
    var score = 0
    var lastUpdateTime: CFTimeInterval = 0
    var powerUps: [PowerUp] = []
    var isPowerActive = false
    var sceneAction = 0
    var powerUpTimeRemaining = 0

    var invincible = false
    var isGameOver = false
    var isBlack = false
    var canJump = false
    var instructionCount = 0
    var numberOfmessages = 0
    var canCountDown = true
    
    var isMusicOn = true
    var hitIcicle = false
    
    //MARK: - Init
    
    override init(size: CGSize) {
        //creatobjects
        flagPole = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "flagpole")), size: CGSize(width: size.width * 0.025, height: size.height * 0.1))
        leadingEdge = Ground(size: size)
        background = SKSpriteNode(imageNamed: "CaveBackground")
        instructionGesture = SKSpriteNode(imageNamed: "tapGesture")
        
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
        instructLarryLabel = SKLabelNode(fontNamed:"LLPixel")
        larryLabel = SKLabelNode(fontNamed: "LLPixel")
        powerUpTimeRemainingLabel = SKLabelNode(fontNamed: "LLPixel")
        
        
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
        backgroundColor = .black
        let safeAreaInsets = self.view?.safeAreaInsets
        
        addChild(background)
        background.position = CGPoint(x: safeAreaInsets?.left ?? size.width / 2, y: safeAreaInsets?.top ?? size.height / 2)
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        background.size.width = size.width
        background.size.height = size.height
        background.zPosition =  0
        
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
        
        addChild(flagPole)
        flagPole.position.x = size.width - flagPole.size.width / 2
        flagPole.position.y = (size.height * 0.5) + (flagPole.size.height / 2)
        flagPole.zPosition = 2
        
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
        
        instructLarryLabel.fontSize = 20
        instructLarryLabel.zPosition = 5
        instructLarryLabel.fontColor = Colors.PlumpPurple
        instructLarryLabel.position.x = size.width / 2
        instructLarryLabel.position.y = size.height * 0.05
        
        powerUpTimeRemainingLabel.zPosition = 5
        powerUpTimeRemainingLabel.fontColor = Colors.PlumpPurple
        powerUpTimeRemainingLabel.position.x = size.width / 2
        powerUpTimeRemainingLabel.position.y = size.height * 0.85
        powerUpTimeRemainingLabel.horizontalAlignmentMode = .center
        powerUpTimeRemainingLabel.verticalAlignmentMode = .top
        
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
        
        setupHayden()
    }
    
    //MASTER VIEW DID LOAD
    override func didMove(to view: SKView) {
        guard let player = player else {return}
        let nodes: [SKSpriteNode] = [leadingEdge, trailingEdge, player, winPad, flagPole]
        cameraShake(layers: nodes, duration: 3)
        
        //onboarding animation
        if UserDefaults.standard.object(forKey: "isNewUser") as? Bool != false {
            let animationStartTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(startAnimationTimer), userInfo: nil, repeats: true)
            timerArray.append(animationStartTimer)
            
            addChild(larryLabel)
            larryLabel.text = "Larry"
            larryLabel.fontSize = 15
            larryLabel.zPosition = 5
            larryLabel.fontColor = .white
            larryLabel.position.x = player.position.x + 5
            larryLabel.position.y = player.position.y + 15
        }
        //music
        if UserDefaults.standard.object(forKey: "isMusicOn") as? Bool == true {
            isMusicOn = true
            print("preference for music is on")
        } else {
            isMusicOn = false
            
            print("preference for music is off")
        }
        //timer for larry to escape
        if UserDefaults.standard.object(forKey: "isNewUser") as? Bool == false {
            let timerForMessage = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(instructLarry), userInfo: nil, repeats: true)
            messageTimers.append(timerForMessage)
            print("text should appear")
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
        //let the player jumper after the animation is complete
        let canJumpTimer = Timer.scheduledTimer(timeInterval: TimeInterval(duration + 1.6), target: self, selector: #selector(setCanJump), userInfo: nil, repeats: false)
        timerArray.append(canJumpTimer)
    }
    
    @objc func setCanJump(){
        canJump = true
    }
    
    
    //MASTER UPDATE PER FRAME
    override func update(_ currentTime: TimeInterval) {
        
        if UserDefaults.standard.object(forKey: "isNewUser") as? Bool != false {
            guard let position = player?.position else {return}
            larryLabel.position.x = position.x + 5
            larryLabel.position.y = position.y + 15
        }
        
        if isGameOver == true {
            print("Game Over!")
            // This is all for the cleanup of the scene so it can deinit
            gameSceneCleanUp()
            self.removeAllActions()
            self.removeAllChildren()
            self.removeFromParent()
            let newGameScene = GameScene(size: size)
            newGameScene.scaleMode = self.scaleMode
            let animation = SKTransition.fade(withDuration: 1.0)
            self.view?.presentScene(newGameScene, transition: animation)
        }
    }
    
    //deallocate
    
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
    
    func instructLarryAgain() {
        let timerForMessage = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(instructLarry), userInfo: nil, repeats: true)
        messageTimers.append(timerForMessage)
    }
    
    // flash label to user
    @objc func instructLarry() {
        if numberOfmessages < 1 {
            numberOfmessages += 1
            addChild(instructLarryLabel)
            switch score {
            case 0:
                instructLarryLabel.text = "Larry, escape the cave by getting to the flag!"
            case 1:
                instructLarryLabel.text = "What? how'd you get back there Larry?"
            case 2:
                instructLarryLabel.text = "Larry! quit doing that!"
            case 3:
                instructLarryLabel.text = "Get out of the cave!!!"
            case 4:
                instructLarryLabel.text = "You're going to die if you stay larry!"
            case 5:
                instructLarryLabel.text = "Do you like doing this larry?"
            case 6:
                instructLarryLabel.text = "Im actually kind of impressed!"
            case 7:
                instructLarryLabel.text = "Where did you get those hops Larry?"
            case 8:
                instructLarryLabel.text = "DAAAMMNN larry!"
            case 9:
                instructLarryLabel.text = "that was fire!"
            case 10:
                instructLarryLabel.text = "You're a wizard Larry!"
            case 11:
                instructLarryLabel.text = "I have no words!"
            case 12:
                instructLarryLabel.text = "Seriously, what the hell?"
            case 13:
                instructLarryLabel.text = "....."
            case 14:
                instructLarryLabel.text = "I CANT LOOK AWAY!"
            case 15:
                instructLarryLabel.text = "I JUST SHIT MY PANTS!"
            case 16:
                instructLarryLabel.text = "I gotta go clean up!"
            default:
                instructLarryLabel.text = ""
            }
            
        } else if numberOfmessages < 2 {
            numberOfmessages += 1
            instructLarryLabel.removeFromParent()
            for timer in messageTimers {
                timer.invalidate()
            }
        }
    }
    
    
    
    func randomNumber(from: UInt32, to: UInt32) -> CGFloat{
        return CGFloat((arc4random() % (to - from)) + from)
    }
}

 
