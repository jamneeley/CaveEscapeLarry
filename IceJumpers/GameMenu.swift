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
    var musicLabel: SKLabelNode
    var isMusicOn = true
    //MARK: - Init
    
    override init(size: CGSize) {
        titleLabel = SKLabelNode(fontNamed: "LLPixel")
        startGameLabel = SKLabelNode(fontNamed: "LLPixel")
        musicLabel = SKLabelNode(fontNamed: "LLPixel")
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
        backgroundColor = Colors.Jet
        
        addChild(titleLabel)
        titleLabel.fontSize = 80
        titleLabel.text = "Ice Jumpers"
        titleLabel.fontColor = Colors.ShockingPink
        titleLabel.horizontalAlignmentMode = .center
        titleLabel.verticalAlignmentMode = .top
        titleLabel.position.x = size.width / 2
        titleLabel.position.y = size.height / 2 + size.height * 0.3
        
        addChild(startGameLabel)
        startGameLabel.fontSize = 40
        startGameLabel.text = "Start Game"
        startGameLabel.fontColor = Colors.PlumpPurple
        startGameLabel.horizontalAlignmentMode = .center
        startGameLabel.verticalAlignmentMode = .top
        startGameLabel.position.x = size.width / 2
        startGameLabel.position.y = size.height / 2 - size.height * 0.1
        
        addChild(musicLabel)
        musicLabel.fontSize = 25
        musicLabel.horizontalAlignmentMode = .center
        musicLabel.verticalAlignmentMode = .top
        musicLabel.position.x = size.width / 2
        musicLabel.position.y = size.height / 2 - size.height * 0.30
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

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches  {
            let location = touch.location(in: self)
            if startGameLabel.contains(location) {
                startGameLabel.fontColor = Colors.TurqoiseBlue
                
                let gameScene = GameScene(size: self.size)
                gameScene.scaleMode = self.scaleMode
                let animation = SKTransition.doorsCloseHorizontal(withDuration: 1.5)
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
