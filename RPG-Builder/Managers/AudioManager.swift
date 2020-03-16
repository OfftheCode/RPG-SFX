//
//  AudioManager.swift
//  RPG-Builder
//
//  Created by Piotr Szadkowski on 16/03/2020.
//  Copyright © 2020 Piotr Szadkowski. All rights reserved.
//

import Foundation
import AVFoundation

struct LocalSound {
    private let soundName: String
    let soundExtension: AVFileType = .mp3
    
    var localURL: URL? {
        Bundle.main.url(forResource: soundName, withExtension: String(soundExtension.rawValue.suffix(3)))
    }
    
    static let testSound = Self.init(soundName: "hit")
}

class AudioManager {
    
    private var player: AVAudioPlayer?
    
    func play(sound: LocalSound) throws {
        guard let url = sound.localURL else { throw AudioManagerError.noFile }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: sound.soundExtension.rawValue)
            
            guard let player = player else { throw AudioManagerError.couldntCreatePlayer }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
            throw AudioManagerError.avSessionError
        }
    }
    
    enum AudioManagerError: Error {
        case noFile
        case couldntCreatePlayer
        case avSessionError
    }
    
}

//import AVFoundation
//
//var player: AVAudioPlayer?
//
//func playSound() {
//    guard let url = Bundle.main.url(forResource: "soundName", withExtension: "mp3") else { return }
//
//    do {
//        try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
//        try AVAudioSession.sharedInstance().setActive(true)
//
//        /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
//        player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
//
//        /* iOS 10 and earlier require the following line:
//        player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
//
//        guard let player = player else { return }
//
//        player.play()
//
//    } catch let error {
//        print(error.localizedDescription)
//    }
//}
