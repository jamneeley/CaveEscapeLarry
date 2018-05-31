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
    
    //setup
    func setupHayden() {
        startIcicles()
        
        let removeNodesTimer = Timer.scheduledTimer(timeInterval: TimeInterval(1), target: self, selector: #selector(removeNodes), userInfo: nil, repeats: true)
        importantTimers.append(removeNodesTimer)
    }
    
    //MARK - Icicles
    
    @objc func startIcicles() {
        if isPowerActive == false {
            
            for icicle in icicles {
                icicle.physicsBody?.isDynamic = true
            }
            
            print("icicles are being created")
            
            let T1 = Timer.scheduledTimer(timeInterval: TimeInterval(2.7), target: self, selector: #selector(createIcicle1), userInfo: nil, repeats: true)
            
            let T2 = Timer.scheduledTimer(timeInterval: TimeInterval(3.7), target: self, selector: #selector(createIcicle2), userInfo: nil, repeats: true)
            
            let T3 = Timer.scheduledTimer(timeInterval: TimeInterval(2.6), target: self, selector: #selector(createIcicle3), userInfo: nil, repeats: true)
            
            let T4 = Timer.scheduledTimer(timeInterval: TimeInterval(2.5), target: self, selector: #selector(createIcicle4), userInfo: nil, repeats: true)
            
            let T5 = Timer.scheduledTimer(timeInterval: TimeInterval(3.2), target: self, selector: #selector(createIcicle5), userInfo: nil, repeats: true)
            
            let T6 = Timer.scheduledTimer(timeInterval: TimeInterval(2.1), target: self, selector: #selector(createIcicle6), userInfo: nil, repeats: true)
            
            let T7 = Timer.scheduledTimer(timeInterval: TimeInterval(2.7), target: self, selector: #selector(createIcicle7), userInfo: nil, repeats: true)
            
            let T8 = Timer.scheduledTimer(timeInterval: TimeInterval(2.6), target: self, selector: #selector(createIcicle8), userInfo: nil, repeats: true)
            
            let T9 = Timer.scheduledTimer(timeInterval: TimeInterval(3.1), target: self, selector: #selector(createIcicle9), userInfo: nil, repeats: true)
            
            let T10 = Timer.scheduledTimer(timeInterval: TimeInterval(2.7), target: self, selector: #selector(createIcicle10), userInfo: nil, repeats: true)
            
            let T11 = Timer.scheduledTimer(timeInterval: TimeInterval(3.2), target: self, selector: #selector(createIcicle11), userInfo: nil, repeats: true)
            
            let T12 = Timer.scheduledTimer(timeInterval: TimeInterval(2.1), target: self, selector: #selector(createIcicle12), userInfo: nil, repeats: true)
            
            timerArray.append(T1)
            timerArray.append(T2)
            timerArray.append(T3)
            timerArray.append(T4)
            timerArray.append(T5)
            timerArray.append(T6)
            timerArray.append(T7)
            timerArray.append(T8)
            timerArray.append(T9)
            timerArray.append(T10)
            timerArray.append(T11)
            timerArray.append(T12)
        }
    }
    
    @objc func createIcicle1() {
        let icicle1 = Icicle(name: "icicle1", position: CGPoint(x: ledgeWidth + (gapWidth + icicleWidth / 2), y: size.height + (icicleHeight * 1)), linearDamp: 2.5, size: CGSize(width: icicleWidth, height: icicleHeight))
        icicles.append(icicle1)
        addChild(icicle1)
    }
    
    @objc func createIcicle2() {
        let icicle2 = Icicle(name: "icicle2", position: CGPoint(x: ((ledgeWidth + gapWidth + icicleWidth / 2) + (gapWidth + icicleWidth * 1)), y: size.height + (icicleHeight * 5)), linearDamp: 2.8, size: CGSize(width: icicleWidth, height: icicleHeight))
        icicles.append(icicle2)
        addChild(icicle2)
    }
    
    @objc func createIcicle3() {
        let icicle3 = Icicle(name: "icicle3", position: CGPoint(x: ((ledgeWidth + gapWidth + icicleWidth / 2)  + (gapWidth + icicleWidth) * 2),y: size.height + (icicleHeight * 3)), linearDamp: 2.0, size: CGSize(width: icicleWidth, height: icicleHeight))
        icicles.append(icicle3)
        addChild(icicle3)
    }
    
    @objc func createIcicle4() {
        let icicle4 = Icicle(name: "icicle4", position:  CGPoint(x: ((ledgeWidth + gapWidth + icicleWidth / 2) + (gapWidth + icicleWidth) * 3), y: size.height + (icicleHeight * 1)), linearDamp: 2.4, size: CGSize(width: icicleWidth, height: icicleHeight))
        icicles.append(icicle4)
        addChild(icicle4)
    }
    
    @objc func createIcicle5() {
        let icicle5 = Icicle(name: "icicle5", position:  CGPoint(x: ((ledgeWidth + gapWidth + icicleWidth / 2) + (gapWidth + icicleWidth) * 4), y: size.height + (icicleHeight * 5)), linearDamp: 2, size: CGSize(width: icicleWidth, height: icicleHeight))
        icicles.append(icicle5)
        addChild(icicle5)
    }
    
    @objc func createIcicle6() {
        let icicle6 = Icicle(name: "icicle6", position:  CGPoint(x: ((ledgeWidth + gapWidth + icicleWidth / 2) + (gapWidth + icicleWidth) * 5), y: size.height + (icicleHeight * 4)), linearDamp: 2.4, size: CGSize(width: icicleWidth, height: icicleHeight))
        icicles.append(icicle6)
        addChild(icicle6)
    }
    
    @objc func createIcicle7() {
        let icicle7 = Icicle(name: "icicle7", position: CGPoint(x: ((ledgeWidth + gapWidth + icicleWidth / 2) + (gapWidth + icicleWidth) * 6), y: size.height + (icicleHeight * 2)), linearDamp: 2, size: CGSize(width: icicleWidth, height: icicleHeight))
        icicles.append(icicle7)
        addChild(icicle7)
    }
    
    @objc func createIcicle8() {
        let icicle8 = Icicle(name: "icicle8", position:  CGPoint(x: ((ledgeWidth + gapWidth + icicleWidth / 2) + (gapWidth + icicleWidth) * 7), y: size.height + (icicleHeight * 1)), linearDamp: 2.2, size: CGSize(width: icicleWidth, height: icicleHeight))
        icicles.append(icicle8)
        addChild(icicle8)
    }
    
    @objc func createIcicle9() {
        let icicle9 = Icicle(name: "icicle9", position: CGPoint(x: ((ledgeWidth + gapWidth + icicleWidth / 2) + (gapWidth + icicleWidth) * 8), y: size.height + (icicleHeight * 5)), linearDamp: 2.1, size: CGSize(width: icicleWidth, height: icicleHeight))
        icicles.append(icicle9)
        addChild(icicle9)
    }
    
    @objc func createIcicle10() {
        let icicle10 = Icicle(name: "icicle10", position: CGPoint(x: ((ledgeWidth + gapWidth + icicleWidth / 2) + (gapWidth + icicleWidth) * 9), y: size.height + (icicleHeight * 3)), linearDamp: 2.5, size: CGSize(width: icicleWidth, height: icicleHeight))
        icicles.append(icicle10)
        addChild(icicle10)
    }
    
    @objc func createIcicle11() {
        let icicle11 = Icicle(name: "icicle11", position: CGPoint(x: ((ledgeWidth + gapWidth + icicleWidth / 2) + (gapWidth + icicleWidth) * 10), y: size.height + (icicleHeight * 1)), linearDamp: 2.7, size: CGSize(width: icicleWidth, height: icicleHeight))
        icicles.append(icicle11)
        addChild(icicle11)
    }
    
    @objc func createIcicle12() {
        let icicle12 = Icicle(name: "icicle12", position:  CGPoint(x: ((ledgeWidth + gapWidth + icicleWidth / 2) + (gapWidth + icicleWidth) * 11), y: size.height + (icicleHeight * 5)), linearDamp: 2.3, size: CGSize(width: icicleWidth, height: icicleHeight))
        icicles.append(icicle12)
        addChild(icicle12)
    }
    
    @objc func stopIcicles() {
        isPowerActive = false
        for timer in timerArray {
            timer.invalidate()
        }
        timerArray.removeAll()
        
        let startIciclesTimer = Timer.scheduledTimer(timeInterval: TimeInterval(8), target: self, selector: #selector(startIcicles), userInfo: nil, repeats: false)
        timerArray.append(startIciclesTimer)
        
        for icicle in icicles {
            icicle.physicsBody?.isDynamic = false
        }
    }
    
    @objc func removeNodes() {
        for child in children{
            if child.position.y < -700 {
                child.removeFromParent()
                child.removeAllActions()
            }
        }
        for icicle in icicles {
            if icicle.position.y < -700 {
                guard let index = icicles.index(of: icicle) else {return}
                icicles.remove(at: index)
            }
        }
    }
}






