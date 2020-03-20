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

extension Sound {
    
    // tmp solution until no more assets are avilable
    var localSound: LocalSound {
        return .testSound
    }
    
}
