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
        
        Timer.scheduledTimer(timeInterval: TimeInterval(2), target: self, selector: #selector(GameScene.createIcicle1), userInfo: nil, repeats: true)
        
        Timer.scheduledTimer(timeInterval: TimeInterval(2.25), target: self, selector: #selector(GameScene.createIcicle2), userInfo: nil, repeats: true)
        
        Timer.scheduledTimer(timeInterval: TimeInterval(1.5), target: self, selector: #selector(GameScene.createIcicle3), userInfo: nil, repeats: true)
        
        Timer.scheduledTimer(timeInterval: TimeInterval(3.5), target: self, selector: #selector(GameScene.createIcicle4), userInfo: nil, repeats: true)
        
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
        let icicle1 = Icicle(name: "icicle1", position: CGPoint(x: size.width * 0.03 + 50, y: 600), linearDamp: 1)
        addChild(icicle1)
    }
    
    @objc func createIcicle2() {
        let icicle2 = Icicle(name: "icicle2", position: CGPoint(x: size.width * 0.03 + 100, y: 600), linearDamp: 0.8)
        
        icicle2.physicsBody?.linearDamping = CGFloat(0.9)
        icicle2.position.y = 700
        addChild(icicle2)
    }
    
    @objc func createIcicle3() {
        let icicle3 = Icicle(name: "icicle3", position: CGPoint(x: size.width * 0.03 + 150, y: 600), linearDamp: 0.7)
        icicle3.position.y = 700
        addChild(icicle3)
    }
    
    @objc func createIcicle4() {
        let icicle4 = Icicle(name: "icicle4", position: CGPoint(x:  size.width * 0.03 + 200, y: 600), linearDamp: 1.2)
        addChild(icicle4)
    }
    
    @objc func createIcicle5() {
        let icicle5 = Icicle(name: "icicle5", position: CGPoint(x:  size.width * 0.03 + 250, y: 600), linearDamp: 0.8)
        addChild(icicle5)
    }
    
    @objc func createIcicle6() {
        let icicle6 = Icicle(name: "icicle6", position: CGPoint(x:  size.width * 0.03 + 300, y: 600), linearDamp: 1)
        addChild(icicle6)
    }
    
    @objc func createIcicle7() {
        let icicle7 = Icicle(name: "icicle7", position: CGPoint(x:  size.width * 0.03 + 350, y: 600), linearDamp: 0.7)
        addChild(icicle7)
    }
    
    @objc func createIcicle8() {
        let icicle8 = Icicle(name: "icicle8", position: CGPoint(x:  size.width * 0.03 + 400, y: 600), linearDamp: 1)
        addChild(icicle8)
    }
    
    @objc func createIcicle9() {
        let icicle9 = Icicle(name: "icicle9", position: CGPoint(x:  size.width * 0.03 + 450, y: 600), linearDamp: 0.9)
        addChild(icicle9)
    }
    
    @objc func createIcicle10() {
        let icicle10 = Icicle(name: "icicle10", position: CGPoint(x:  size.width * 0.03 + 500, y: 600), linearDamp: 1.1)
        addChild(icicle10)
    }
    
    @objc func createIcicle11() {
        let icicle11 = Icicle(name: "icicle11", position: CGPoint(x:  size.width * 0.03 + 550, y: 600), linearDamp: 0.7)
        addChild(icicle11)
    }
    
    @objc func createIcicle12() {
        let icicle12 = Icicle(name: "icicle12", position: CGPoint(x:  size.width * 0.03 + 600, y: 600), linearDamp: 0.9)
        addChild(icicle12)
    }
    
    @objc func createIcicle13() {
        let icicle13 = Icicle(name: "icicle13", position: CGPoint(x:  size.width * 0.03 + 650, y: 600), linearDamp: 1.2)
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








