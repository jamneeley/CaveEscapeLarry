//
//  GameSceneJames.swift
//  iceJumper
//
//  Created by James Neeley on 5/21/18.
//  Copyright © 2018 JamesNeeley. All rights reserved.
//

import SpriteKit

/////JAMES

extension GameScene {
    
    func setupJames() {
        
    }
    
    func updateJames() {
        isPlayerMoving()
        updatePlayerPosition()
    }
    
    func updatePlayerPosition() {
        guard let player = player else {return}
        playerY = player.position.y
        playerX = player.position.x
    }
    
    func isPlayerMoving() {
        guard let player = player else {return}
        if player.position.x != playerX || player.position.y != playerY {
            playerMoving = true
        } else {
            playerMoving = false
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches  {
            let location = touch.location(in: self)
            if menuLabel.contains(location) {
                
                if let highScore = UserDefaults.standard.object(forKey: "highScore") as? Int {
                    if score > highScore {
                        UserDefaults.standard.set(score, forKey: "highScore")
                        print("highScore saved")
                    }
                }
                
                let gameScene = GameMenu(size: self.size)
                gameScene.scaleMode = self.scaleMode
                let animation = SKTransition.doorway(withDuration: 2)
                self.view?.presentScene(gameScene, transition: animation)
                
                gameSceneCleanUp()
                
            } else {
                touchStartLocation = location
            }
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let angle = findAngle(StartPoint: touchStartLocation, EndPoint: location)
            playerJumped(Angle: angle)
        }
    }
    
    func findAngle(StartPoint: CGPoint, EndPoint: CGPoint) -> CGFloat{
        //        print("Y2: \(EndPoint.y) Y1: \(StartPoint.y),  X2: \(EndPoint.x) X1 \(StartPoint.x)")
        let radians = atan2(StartPoint.y - EndPoint.y, StartPoint.x - EndPoint.x)
        let degree = radians * 180.0 / CGFloat.pi
        return degree
    }
    
    func playerJumped(Angle angle: CGFloat) {
        //        print(angle)
        //        if playerMoving == false {
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
        guard let player = player else {return}
        if canJump {
            player.physicsBody?.applyImpulse(CGVector(dx: dx, dy: dy))
        }
    }
    
    func resetPlayer() {
        powerUps.removeAll()
        if let player = player {
            player.removeFromParent()
        }
        let randomColor = UIColor(hue: randomNumber(from: 0, to: 80)/360.0, saturation: 100.0/100.0, brightness: 100.0/100.0, alpha: 1.0)
        let playerLocal = Player(color: randomColor)
        playerLocal.physicsBody!.mass = 0.12
        playerLocal.position.x = (size.width * 0.03) - (playerLocal.size.width / 2)
        playerLocal.position.y = (size.height / 2) + (playerLocal.size.height / 2)
        playerLocal.zPosition = 2
        player = playerLocal
        guard let player = player else {return}
        addChild(player)
    }
    
    func createPowerUps(gravity: Int, invincible: Int) {
        var powerUps = [PowerUp]()
        //Gravity Powerups
        for _ in 0..<gravity {
            let powerUp = PowerUp(name:"gravity", color: Colors.CreameBlue)
            let leadingEdge = UInt32(size.width * 0.25)
            let trailingEdge = UInt32(size.width * 0.75)
            let topEdge = UInt32(size.height * 0.75)
            let bottomEdge = UInt32(size.height * 0.25)
            powerUp.position = CGPoint(x: randomNumber(from: leadingEdge, to: trailingEdge), y: randomNumber(from: bottomEdge, to: topEdge))
            powerUps.append(powerUp)
        }
        //Invincible PowerUps
        for _ in 0..<invincible {
            let powerUp = PowerUp(name:"invincible", color: .green)
            let leadingEdge = UInt32(size.width * 0.25)
            let trailingEdge = UInt32(size.width * 0.75)
            let topEdge = UInt32(size.height * 0.75)
            let bottomEdge = UInt32(size.height * 0.25)
            powerUp.position = CGPoint(x: randomNumber(from: leadingEdge, to: trailingEdge), y: randomNumber(from: bottomEdge, to: topEdge))
            powerUps.append(powerUp)
        }
        self.powerUps = powerUps
        for powerUp in self.powerUps {
            addChild(powerUp)
        }
        let strobeTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(strobeGravity), userInfo: nil, repeats: true)
        importantTimers.append(strobeTimer)
        
        let colorTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(strobeInvincibility), userInfo: nil, repeats: true)
        importantTimers.append(colorTimer)
    }
    
    @objc func strobeGravity(){
        if isBlack == false {
            for powerUp in powerUps {
                if powerUp.name == "gravity" {
                    powerUp.color = .lightGray
                    isBlack = true
                }
            }
        } else {
            for powerUp in powerUps {
                if powerUp.name == "gravity" {
                    powerUp.color = Colors.CreameBlue
                    isBlack = false
                }
            }
        }
    }
    
    @objc func strobeInvincibility() {
        let randomColor = UIColor(hue: randomNumber(from: 0, to: 360)/360.0, saturation: 100.0/100.0, brightness: 100.0/100.0, alpha: 1.0)
        for powerUp in powerUps {
            if powerUp.name == "invincible" {
                powerUp.color = randomColor
            }
        }
    }
    
    func randomNumber(from: UInt32, to: UInt32) -> CGFloat{
        return CGFloat((arc4random() % (to - from)) + from)
    }
    
    
    func didBegin(_ contact: SKPhysicsContact) {
        let collision = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        //if collision is with losePad
        if collision == PhysicsCatagory.Player | PhysicsCatagory.LoosePad  {
            loseGame()
            
        } else if collision == PhysicsCatagory.Player | PhysicsCatagory.Icicle {
            print("Hit icicle")
            if invincible == false {
                hitIcicle = true
                loseGame()
            }
            //if collision is with winPad
        }else if collision == PhysicsCatagory.Player | PhysicsCatagory.WinPad {
            score += 1
            scoreLabel.text = "Score: \(score)"
            resetPlayer()
        } else if collision == PhysicsCatagory.Player | PhysicsCatagory.PowerUp {
            for powerUp in powerUps {
                if contact.bodyB.node?.name == powerUp.name {
                    guard let name = contact.bodyB.node?.name else {return}
                    //if gravity
                    if name == "gravity" {
                        activateGravityPU()
                        powerUp.removeFromParent()
                        //if invincible
                    } else if name == "invincible" {
                        activateInvinciblePU()
                        powerUp.removeFromParent()
                        //if third powerup
                    } else {
                        print("no name")
                    }
                }
            }
        }
    }
    
    func loseGame() {
        canJump = false
        player?.color = .red
        if let highScore = UserDefaults.standard.object(forKey: "highScore") as? Int {
            if score > highScore {
                UserDefaults.standard.set(score, forKey: "highScore")
                print("highScore saved")
            }
        }
        
        score = 0
        scoreLabel.text = "Score: \(score)"
        youDiedLabel.text = "YOU DIED"
        if isMusicOn == true {
            GameSounds.shared.playDeathSound()
            isMusicOn = false
        }
        
        if isMusicOn == true && hitIcicle == true {
            GameSounds.shared.playDeathSound()
            hitIcicle = false
            isMusicOn = false
        }
        let looseTimer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(changeGameStatus), userInfo: nil, repeats: false)
        importantTimers.append(looseTimer)
        UserDefaults.standard.set(false, forKey: "isNewUser")
    }
    
    @objc func changeGameStatus() {
        isGameOver = true
    }
    
    func activateGravityPU() {
        isPowerActive = true
        print("icicles have stopped")
        if isMusicOn == true && isPowerActive == true {
            GameSounds.shared.playPowerUpSoundThree()
        }
        
        if isPowerActive == true {
            stopIcicles()
        }
    }
    
    func activateInvinciblePU() {
        Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(stopInvincibility), userInfo: nil, repeats: false)
        invincible = true
        if isMusicOn == true && invincible == true {
            GameSounds.shared.playPowerUpSoundOne()
        }
        print("PHYSICS CATAGORY CHANGED")
    }
    
    @objc func stopInvincibility() {
        invincible = false
    }
}














