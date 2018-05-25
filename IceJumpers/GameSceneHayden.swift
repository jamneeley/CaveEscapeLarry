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
        //initialized
        startIcicles()
        Timer.scheduledTimer(timeInterval: TimeInterval(1), target: self, selector: #selector(GameScene.removeNodes), userInfo: nil, repeats: true)
    }
    
    
    @objc func startIcicles() {
        if sceneAction == 0 && isPowerActive == false {
            print("icicles are being created")
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
        }
        
        if sceneAction > 0 && isPowerActive == false {
            for icicle in icicles {
                icicle.physicsBody?.isDynamic = true
            }
            icicles.removeAll()
            
            Timer.scheduledTimer(timeInterval: TimeInterval(4), target: self, selector: #selector(GameScene.createIcicle1), userInfo: nil, repeats: true)
            
            Timer.scheduledTimer(timeInterval: TimeInterval(4.25), target: self, selector: #selector(GameScene.createIcicle2), userInfo: nil, repeats: true)
            
            Timer.scheduledTimer(timeInterval: TimeInterval(3.5), target: self, selector: #selector(GameScene.createIcicle3), userInfo: nil, repeats: true)
            
            Timer.scheduledTimer(timeInterval: TimeInterval(5.5), target: self, selector: #selector(GameScene.createIcicle4), userInfo: nil, repeats: true)
            
            Timer.scheduledTimer(timeInterval: TimeInterval(4.1), target: self, selector: #selector(GameScene.createIcicle5), userInfo: nil, repeats: true)
            
            Timer.scheduledTimer(timeInterval: TimeInterval(4.25), target: self, selector: #selector(GameScene.createIcicle6), userInfo: nil, repeats: true)
            
            Timer.scheduledTimer(timeInterval: TimeInterval(4), target: self, selector: #selector(GameScene.createIcicle7), userInfo: nil, repeats: true)
            
            Timer.scheduledTimer(timeInterval: TimeInterval(4.35), target: self, selector: #selector(GameScene.createIcicle8), userInfo: nil, repeats: true)
            
            Timer.scheduledTimer(timeInterval: TimeInterval(5.25), target: self, selector: #selector(GameScene.createIcicle9), userInfo: nil, repeats: true)
            
            Timer.scheduledTimer(timeInterval: TimeInterval(4.30), target: self, selector: #selector(GameScene.createIcicle10), userInfo: nil, repeats: true)
            
            Timer.scheduledTimer(timeInterval: TimeInterval(6), target: self, selector: #selector(GameScene.createIcicle11), userInfo: nil, repeats: true)
            
            Timer.scheduledTimer(timeInterval: TimeInterval(4.75), target: self, selector: #selector(GameScene.createIcicle12), userInfo: nil, repeats: true)
        }
    }
    
    func updateHayden() {
        
    }
    
    @objc func createIcicle1() {
        let icicle1 = Icicle(name: "icicle1", position: CGPoint(x: size.width * 0.03 + 50, y: 750), linearDamp: 1)
        icicles.append(icicle1)
        addChild(icicle1)
    }
    
    @objc func createIcicle2() {
        let icicle2 = Icicle(name: "icicle2", position: CGPoint(x: size.width * 0.03 + 100, y: 750), linearDamp: 0.8)
        icicles.append(icicle2)
        addChild(icicle2)
    }
    
    @objc func createIcicle3() {
        let icicle3 = Icicle(name: "icicle3", position: CGPoint(x: size.width * 0.03 + 150, y: 750), linearDamp: 0.7)
        icicles.append(icicle3)
        addChild(icicle3)
    }
    
    @objc func createIcicle4() {
        let icicle4 = Icicle(name: "icicle4", position: CGPoint(x:  size.width * 0.03 + 200, y: 750), linearDamp: 1.2)
        icicles.append(icicle4)
        addChild(icicle4)
    }
    
    @objc func createIcicle5() {
        let icicle5 = Icicle(name: "icicle5", position: CGPoint(x:  size.width * 0.03 + 250, y: 750), linearDamp: 0.8)
        icicles.append(icicle5)
        addChild(icicle5)
    }
    
    @objc func createIcicle6() {
        let icicle6 = Icicle(name: "icicle6", position: CGPoint(x:  size.width * 0.03 + 300, y: 750), linearDamp: 1)
        icicles.append(icicle6)
        addChild(icicle6)
    }
    
    @objc func createIcicle7() {
        let icicle7 = Icicle(name: "icicle7", position: CGPoint(x:  size.width * 0.03 + 350, y: 750), linearDamp: 0.7)
        icicles.append(icicle7)
        addChild(icicle7)
    }
    
    @objc func createIcicle8() {
        let icicle8 = Icicle(name: "icicle8", position: CGPoint(x:  size.width * 0.03 + 400, y: 750), linearDamp: 1)
        icicles.append(icicle8)
        addChild(icicle8)
    }
    
    @objc func createIcicle9() {
        let icicle9 = Icicle(name: "icicle9", position: CGPoint(x:  size.width * 0.03 + 450, y: 750), linearDamp: 0.9)
        icicles.append(icicle9)
        addChild(icicle9)
    }
    
    @objc func createIcicle10() {
        let icicle10 = Icicle(name: "icicle10", position: CGPoint(x:  size.width * 0.03 + 500, y: 750), linearDamp:
            1.1)
        icicles.append(icicle10)
        addChild(icicle10)
    }
    
    @objc func createIcicle11() {
        let icicle11 = Icicle(name: "icicle11", position: CGPoint(x:  size.width * 0.03 + 550, y: 700), linearDamp: 0.7)
        icicles.append(icicle11)
        addChild(icicle11)
    }
    
    @objc func createIcicle12() {
        let icicle12 = Icicle(name: "icicle12", position: CGPoint(x:  size.width * 0.03 + 600, y: 700), linearDamp: 0.9)
        icicles.append(icicle12)
        addChild(icicle12)
    }
    
    @objc func stopIcicles() {
        Timer.scheduledTimer(timeInterval: TimeInterval(2), target: self, selector: #selector(startIcicles), userInfo: nil, repeats: false)
        for icicle in icicles {
            icicle.physicsBody?.isDynamic = false
        }
        isPowerActive = false
        sceneAction += 1
    }
    
    @objc func removeNodes() {
        for child in children{
            if child.position.y < -700 {
                child.removeFromParent()
            }
        }
    }
}








