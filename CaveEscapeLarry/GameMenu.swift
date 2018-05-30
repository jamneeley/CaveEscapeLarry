//
//  GameMenu.swift
//  iceJumper
//
//  Created by Hayden Murdock on 5/23/18.
//  Copyright © 2018 JamesNeeley. All rights reserved.
//

import Foundation
import SpriteKit

class GameMenu: SKScene{
    //MARK: - Properties
    
    var titleLabel: SKLabelNode
    var startGameLabel: SKLabelNode
    var highScoreLabel: SKLabelNode
    var musicLabel: SKLabelNode
    var isMusicOn = true
    var larry: SKSpriteNode
    //MARK: - Init
    
    override init(size: CGSize) {
        
        larry = SKSpriteNode(color: Colors.TurqoiseBlue, size: CGSize(width: 15, height: 15))
        titleLabel = SKLabelNode(fontNamed: "LLPixel")
        startGameLabel = SKLabelNode(fontNamed: "LLPixel")
        musicLabel = SKLabelNode(fontNamed: "LLPixel")
        highScoreLabel = SKLabelNode(fontNamed: "LLPixel")
        super.init(size: size)
        preferenceForMusic()
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("Menu Deallocated")
    }
    
    //MARK: - Methods

    func setup() {

        setHighScore()
        backgroundColor = Colors.Jet
    
        addChild(highScoreLabel)
        let highScore = UserDefaults.standard.object(forKey: "highScore") as? Int ?? 0
        highScoreLabel.text = "HighScore: \(highScore)"
        highScoreLabel.position.x = 10
        highScoreLabel.position.y = size.height - 10
        highScoreLabel.verticalAlignmentMode = .top
        highScoreLabel.horizontalAlignmentMode = .left
        highScoreLabel.fontColor = Colors.TurqoiseBlue
        highScoreLabel.fontSize = 24
        highScoreLabel.zPosition = 2
        
        addChild(titleLabel)

        titleLabel.fontSize = 60
        titleLabel.text = "Cave Escape Larry"
        titleLabel.fontColor = Colors.ShockingPink
        titleLabel.horizontalAlignmentMode = .center
        titleLabel.verticalAlignmentMode = .top
        titleLabel.position.x = size.width / 2
        titleLabel.position.y = size.height / 2 + size.height * 0.2
        titleLabel.zPosition = 2
        
        addChild(startGameLabel)
        startGameLabel.fontSize = 40
        startGameLabel.text = "Start Game"
        startGameLabel.fontColor = Colors.PlumpPurple
        startGameLabel.horizontalAlignmentMode = .center
        startGameLabel.verticalAlignmentMode = .top
        startGameLabel.position.x = size.width / 2
        startGameLabel.position.y = size.height / 2 - size.height * 0.1
        startGameLabel.zPosition = 2
        
        addChild(musicLabel)
        musicLabel.fontSize = 25
        musicLabel.horizontalAlignmentMode = .center
        musicLabel.verticalAlignmentMode = .top
        musicLabel.position.x = size.width / 2
        musicLabel.position.y = size.height / 2 - size.height * 0.30
        musicLabel.zPosition = 2
        if isMusicOn == true{
            musicLabel.text = "music: On"
            musicLabel.fontColor = Colors.CreameBlue
            GameSounds.shared.playMenuSound()
        }else {
            musicLabel.text = "music: Off"
            musicLabel.fontColor = UIColor.red
        }
    }

    override func didMove(to view: SKView) {
        animateLarry()
    }
    
    override func update(_ currentTime: TimeInterval) {
        if larry.position.x >= size.width {
            larry.removeAllActions()
            larry.removeFromParent()
            animateLarry()
        }
    }
    
    func animateLarry() {
        var yActionArray: [SKAction] = []
        addChild(larry)
        larry.zPosition = 1
        larry.position.x = -(size.width / 2)
        
        larry.position.y = size.height / 2 - (size.height * 0.07)
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
    
    func setHighScore() {
        if isKeyPresentInUserDefaults(key:"highScore") == false {
            UserDefaults.standard.set(0, forKey: "highScore")
            print("HighScore Saved")
        }
    }
    
    func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches  {
            let location = touch.location(in: self)
            if startGameLabel.contains(location) {
                startGameLabel.fontColor = Colors.TurqoiseBlue
                
                let gameScene = GameScene(size: self.size)
                gameScene.scaleMode = self.scaleMode
                let animation = SKTransition.doorsCloseHorizontal(withDuration: 1.0)
                self.view?.presentScene(gameScene, transition: animation)
                
            }
            if musicLabel.contains(location){
                if isMusicOn == true {
                    UserDefaults.standard.set(false, forKey: "isMusicOn")
                    isMusicOn = false
                    musicLabel.text = "music: Off"
                    musicLabel.fontColor = UIColor.red
                    GameSounds.shared.stopPlayingSound()
                } else {
                    UserDefaults.standard.set(true, forKey: "isMusicOn")
                    isMusicOn = true
                    musicLabel.text = "music: On"
                    musicLabel.fontColor = Colors.CreameBlue
                    GameSounds.shared.playMenuSound()
                }
                
            }
        }
    }
 
    func preferenceForMusic() {
        if UserDefaults.standard.object(forKey: "isMusicOn") as? Bool == true {
            isMusicOn = true
            print("preference for music is on")
        } else {
            isMusicOn = false
            
            print("preference for music is off")
        }
    }
}
