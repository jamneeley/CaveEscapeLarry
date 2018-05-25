//
//  GameSounds.swift
//  IceJumpers
//
//  Created by Francisco Diarte on 5/24/18.
//  Copyright © 2018 JamesNeeley. All rights reserved.
//

import Foundation
import AVFoundation

class GameSounds {
    
    static let shared = GameSounds()
    private var audioPlayer = AVAudioPlayer()
    
    func playMenuSound() {
        guard let url = Bundle.main.url(forResource: "Menu", withExtension: "mp3") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            audioPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            audioPlayer.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func stopPlayingSound() {
        audioPlayer.stop()
    }
    
    func playInGameSounds() {
        guard let url = Bundle.main.url(forResource: "InGameSounds", withExtension: "mp3") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            audioPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            audioPlayer.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func playDeathSound() {
        guard let url = Bundle.main.url(forResource: "DeathSound", withExtension: "mp3") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            audioPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            audioPlayer.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
//    func playPowerUpSound() {
//        guard let url = Bundle.main.url(forResource: "PowerUpSound", withExtension: "mp3") else { return }
//        do {
//            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
//            try AVAudioSession.sharedInstance().setActive(true)
//            audioPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
//            audioPlayer.play()
//        } catch let error {
//            print(error.localizedDescription)
//        }
//    }
}

