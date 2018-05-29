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
    private var powerUpPlayer = AVAudioPlayer()
    
    func stopPlayingSound() {
        audioPlayer.stop()
    }
    
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
    
    func playInGameSounds() {
        guard let url = Bundle.main.url(forResource: "InGameSounds", withExtension: "mp3") else { return }
        do {
            audioPlayer.stop()
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
            audioPlayer.stop()
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            audioPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            audioPlayer.play()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.playInGameSounds()
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func playPowerUpSoundOne() {
        guard let url = Bundle.main.url(forResource: "powerUpOne", withExtension: "wav") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            powerUpPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            powerUpPlayer.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func playPowerUpSoundTwo() {
        guard let url = Bundle.main.url(forResource: "powerUpTwo", withExtension: "wav") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            powerUpPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            powerUpPlayer.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func playPowerUpSoundThree() {
        guard let url = Bundle.main.url(forResource: "powerUpThree", withExtension: "wav") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            powerUpPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            powerUpPlayer.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

