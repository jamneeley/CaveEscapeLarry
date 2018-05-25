//
//  PhysicsCatgagory.swift
//  iceJumper
//
//  Created by James Neeley on 5/23/18.
//  Copyright © 2018 JamesNeeley. All rights reserved.
//

import SpriteKit

struct PhysicsCatagory {
    static let None: UInt32                     = 0
    static let Player: UInt32                   = 0b10
    static let Platform: UInt32                 = 0b100
    static let WinPad: UInt32                   = 0b1000
    static let LoosePad: UInt32                 = 0b10000
    static let PowerUp: UInt32                  = 0b100000
    static let Icicle: UInt32                   = 0b100001
}
