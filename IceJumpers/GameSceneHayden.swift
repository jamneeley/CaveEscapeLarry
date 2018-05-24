//
//  GameSceneHayden.swift
//  iceJumper
//
//  Created by James Neeley on 5/21/18.
//  Copyright © 2018 JamesNeeley. All rights reserved.
//

import SpriteKit


////HAYDEN


extension GameScene {
    
    
    
    func setupHayden() {
//        initialized
        
        Timer.scheduledTimer(timeInterval: TimeInterval(2.5), target: self, selector: #selector(GameScene.createIcicle1), userInfo: nil, repeats: true)
        
        Timer.scheduledTimer(timeInterval: TimeInterval(2.75), target: self, selector: #selector(GameScene.createIcicle2), userInfo: nil, repeats: true)
        
        Timer.scheduledTimer(timeInterval: TimeInterval(2.2), target: self, selector: #selector(GameScene.createIcicle3), userInfo: nil, repeats: true)
        
        Timer.scheduledTimer(timeInterval: TimeInterval(4), target: self, selector: #selector(GameScene.createIcicle4), userInfo: nil, repeats: true)
        
        Timer.scheduledTimer(timeInterval: TimeInterval(2.1), target: self, selector: #selector(GameScene.createIcicle5), userInfo: nil, repeats: true)
        
        Timer.scheduledTimer(timeInterval: TimeInterval(2.25), target: self, selector: #selector(GameScene.createIcicle6), userInfo: nil, repeats: true)
        
        Timer.scheduledTimer(timeInterval: TimeInterval(2), target: self, selector: #selector(GameScene.createIcicle7), userInfo: nil, repeats: true)
        
        Timer.scheduledTimer(timeInterval: TimeInterval(2.35), target: self, selector: #selector(GameScene.createIcicle8), userInfo: nil, repeats: true)
        
        Timer.scheduledTimer(timeInterval: TimeInterval(3.25), target: self, selector: #selector(GameScene.createIcicle9), userInfo: nil, repeats: true)
        
        Timer.scheduledTimer(timeInterval: TimeInterval(2.30), target: self, selector: #selector(GameScene.createIcicle10), userInfo: nil, repeats: true)
        
        Timer.scheduledTimer(timeInterval: TimeInterval(4), target: self, selector: #selector(GameScene.createIcicle11), userInfo: nil, repeats: true)
        
        Timer.scheduledTimer(timeInterval: TimeInterval(2.75), target: self, selector: #selector(GameScene.createIcicle12), userInfo: nil, repeats: true)
        
        Timer.scheduledTimer(timeInterval: TimeInterval(3.50), target: self, selector: #selector(GameScene.createIcicle13), userInfo: nil, repeats: true)
        
        //////Timer.scheduledTimer(timeInterval: TimeInterval(2.30), target: self, selector: #selector(GameScene.createIcicle14), userInfo: nil, repeats: true)
        
        Timer.scheduledTimer(timeInterval: TimeInterval(1), target: self, selector: #selector(GameScene.removeIciciles), userInfo: nil, repeats: true)
    }


    
    
    func updateHayden() {
        
    }
    
    @objc func createIcicle1() {
        let icicle1 = Icicle(name: "icicle1", position: CGPoint(x: size.width * 0.03 + 15, y: 700), linearDamp: 1)
        addChild(icicle1)
    }
    
    @objc func createIcicle2() {
        let icicle2: SKSpriteNode!
        icicle2 = SKSpriteNode(imageNamed: "Icicle")
        icicle2.size = CGSize(width: 100, height: 140)
        icicle2.name = "Icicle2"
        icicle2.physicsBody = SKPhysicsBody(texture: icicle2.texture!, size: icicle2.size)
        icicle2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        icicle2.physicsBody?.isDynamic = true
        icicle2.physicsBody?.affectedByGravity = true
        icicle2.physicsBody?.allowsRotation = false
        icicle2.zPosition = 10
        icicle2.position.x = -500
        icicle2.physicsBody?.linearDamping = CGFloat(0.9)
        icicle2.position.y = 700
        addChild(icicle2)
    }
    
    @objc func createIcicle3() {
        let icicle3: SKSpriteNode!
        icicle3 = SKSpriteNode(imageNamed: "Icicle")
        icicle3.size = CGSize(width: 100, height: 140)
        icicle3.name = "Icicle3"
        icicle3.physicsBody = SKPhysicsBody(texture: icicle3.texture!, size: icicle3.size)
        icicle3.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        icicle3.physicsBody?.isDynamic = true
        icicle3.physicsBody?.affectedByGravity = true
        icicle3.physicsBody?.allowsRotation = false
        icicle3.zPosition = 10
        icicle3.position.x = -400
        icicle3.physicsBody?.linearDamping = CGFloat(0.8)
        icicle3.position.y = 700
        addChild(icicle3)
    }
    
    @objc func createIcicle4() {
        let icicle4: SKSpriteNode!
        icicle4 = SKSpriteNode(imageNamed: "Icicle")
        icicle4.size = CGSize(width: 100, height: 140)
        icicle4.name = "Icicle4"
        icicle4.physicsBody = SKPhysicsBody(texture: icicle4.texture!, size: icicle4.size)
        icicle4.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        icicle4.physicsBody?.isDynamic = true
        icicle4.physicsBody?.affectedByGravity = true
        icicle4.physicsBody?.allowsRotation = false
        icicle4.zPosition = 10
        icicle4.position.x = -300
        icicle4.physicsBody?.linearDamping = CGFloat(1.10)
        icicle4.position.y = 700
        addChild(icicle4)
    }
    
    @objc func createIcicle5() {
        let icicle5: SKSpriteNode!
        icicle5 = SKSpriteNode(imageNamed: "Icicle")
        icicle5.size = CGSize(width: 100, height: 140)
        icicle5.name = "Icicle5"
        icicle5.physicsBody = SKPhysicsBody(texture: icicle5.texture!, size: icicle5.size)
        icicle5.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        icicle5.physicsBody?.isDynamic = true
        icicle5.physicsBody?.affectedByGravity = true
        icicle5.physicsBody?.allowsRotation = false
        icicle5.zPosition = 10
        icicle5.position.x = -200
        icicle5.physicsBody?.linearDamping = CGFloat(0.7)
        icicle5.position.y = 700
        addChild(icicle5)
    }
    
    @objc func createIcicle6() {
        let icicle6: SKSpriteNode!
        icicle6 = SKSpriteNode(imageNamed: "Icicle")
        icicle6.size = CGSize(width: 100, height: 140)
        icicle6.name = "Icicle6"
        icicle6.physicsBody = SKPhysicsBody(texture: icicle6.texture!, size: icicle6.size)
        icicle6.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        icicle6.physicsBody?.isDynamic = true
        icicle6.physicsBody?.affectedByGravity = true
        icicle6.physicsBody?.allowsRotation = false
        icicle6.zPosition = 10
        icicle6.position.x = -100
        icicle6.physicsBody?.linearDamping = CGFloat(1.10)
        icicle6.position.y = 700
        addChild(icicle6)
    }
    
    @objc func createIcicle7() {
        let icicle7: SKSpriteNode!
        icicle7 = SKSpriteNode(imageNamed: "Icicle")
        icicle7.size = CGSize(width: 100, height: 140)
        icicle7.name = "Icicle7"
        icicle7.physicsBody = SKPhysicsBody(texture: icicle7.texture!, size: icicle7.size)
        icicle7.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        icicle7.physicsBody?.isDynamic = true
        icicle7.physicsBody?.affectedByGravity = true
        icicle7.physicsBody?.allowsRotation = false
        icicle7.zPosition = 10
        icicle7.physicsBody?.linearDamping = CGFloat(0.9)
        icicle7.position.x = 0
        icicle7.position.y = 700
        addChild(icicle7)
    }
    
    @objc func createIcicle8() {
        let icicle8: SKSpriteNode!
        icicle8 = SKSpriteNode(imageNamed: "Icicle")
        icicle8.size = CGSize(width: 100, height: 140)
        icicle8.name = "Icicle8"
        icicle8.physicsBody = SKPhysicsBody(texture: icicle8.texture!, size: icicle8.size)
        icicle8.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        icicle8.physicsBody?.isDynamic = true
        icicle8.physicsBody?.affectedByGravity = true
        icicle8.physicsBody?.allowsRotation = false
        icicle8.physicsBody?.linearDamping = CGFloat(1.30)
        icicle8.zPosition = 10
        icicle8.position.x = 100
        icicle8.position.y = 700
        addChild(icicle8)
    }
    
    @objc func createIcicle9() {
        let icicle9: SKSpriteNode!
        icicle9 = SKSpriteNode(imageNamed: "Icicle")
        icicle9.size = CGSize(width: 100, height: 140)
        icicle9.name = "Icicle9"
        icicle9.physicsBody = SKPhysicsBody(texture: icicle9.texture!, size: icicle9.size)
        icicle9.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        icicle9.physicsBody?.isDynamic = true
        icicle9.physicsBody?.affectedByGravity = true
        icicle9.physicsBody?.allowsRotation = false
        icicle9.zPosition = 10
        icicle9.physicsBody?.linearDamping = CGFloat(1)
        icicle9.position.x = 200
        icicle9.position.y = 700
        addChild(icicle9)
    }
    
    @objc func createIcicle10() {
        let icicle10: SKSpriteNode!
        icicle10 = SKSpriteNode(imageNamed: "Icicle")
        icicle10.size = CGSize(width: 100, height: 140)
        icicle10.name = "Icicle10"
        icicle10.physicsBody = SKPhysicsBody(texture: icicle10.texture!, size: icicle10.size)
        icicle10.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        icicle10.physicsBody?.isDynamic = true
        icicle10.physicsBody?.affectedByGravity = true
        icicle10.physicsBody?.allowsRotation = false
        icicle10.zPosition = 10
        icicle10.physicsBody?.linearDamping = CGFloat(0.70)
        icicle10.position.x = 300
        icicle10.position.y = 700
        addChild(icicle10)
    }
    
    @objc func createIcicle11() {
        let icicle11: SKSpriteNode!
        icicle11 = SKSpriteNode(imageNamed: "Icicle")
        icicle11.size = CGSize(width: 100, height: 140)
        icicle11.name = "Icicle11"
        icicle11.physicsBody = SKPhysicsBody(texture: icicle11.texture!, size: icicle11.size)
        icicle11.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        icicle11.physicsBody?.isDynamic = true
        icicle11.physicsBody?.affectedByGravity = true
        icicle11.physicsBody?.allowsRotation = false
        icicle11.zPosition = 10
        icicle11.physicsBody?.linearDamping = CGFloat(1.5)
        icicle11.position.x = 400
        icicle11.position.y = 700
        addChild(icicle11)
    }
    
    @objc func createIcicle12() {
        let icicle12: SKSpriteNode!
        icicle12 = SKSpriteNode(imageNamed: "Icicle")
        icicle12.size = CGSize(width: 100, height: 140)
        icicle12.name = "Icicle12"
        icicle12.physicsBody = SKPhysicsBody(texture: icicle12.texture!, size: icicle12.size)
        icicle12.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        icicle12.physicsBody?.isDynamic = true
        icicle12.physicsBody?.affectedByGravity = true
        icicle12.physicsBody?.allowsRotation = false
        icicle12.zPosition = 10
        icicle12.physicsBody?.linearDamping = CGFloat(0.8)
        icicle12.position.x = 500
        icicle12.position.y = 700
        addChild(icicle12)
    }
    
    @objc func createIcicle13() {
        let icicle13: SKSpriteNode!
        icicle13 = SKSpriteNode(imageNamed: "Icicle")
        icicle13.size = CGSize(width: 100, height: 140)
        icicle13.name = "Icicle13"
        icicle13.physicsBody = SKPhysicsBody(texture: icicle13.texture!, size: icicle13.size)
        icicle13.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        icicle13.physicsBody?.isDynamic = true
        icicle13.physicsBody?.affectedByGravity = true
        icicle13.physicsBody?.allowsRotation = false
        icicle13.zPosition = 10
        icicle13.physicsBody?.linearDamping = CGFloat(1)
        icicle13.position.x =  600
        icicle13.position.y = 700
        addChild(icicle13)
    }
    
    @objc func createIcicle14() {
        let icicle14: SKSpriteNode!
        icicle14 = SKSpriteNode(imageNamed: "Icicle")
        icicle14.size = CGSize(width: 100, height: 140)
        icicle14.name = "Icicle14"
        icicle14.physicsBody = SKPhysicsBody(texture: icicle14.texture!, size: icicle14.size)
        icicle14.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        icicle14.physicsBody?.isDynamic = true
        icicle14.physicsBody?.affectedByGravity = true
        icicle14.physicsBody?.allowsRotation = false
        icicle14.zPosition = 10
        icicle14.physicsBody?.linearDamping = CGFloat(1.5)
        icicle14.position.x = 612
        icicle14.position.y = 750
        addChild(icicle14)
    }
    
    
    @objc func removeIciciles() {
        for child in children{
            if child.position.y < -700 {
                child.removeFromParent()
            }
        }
    }
}








