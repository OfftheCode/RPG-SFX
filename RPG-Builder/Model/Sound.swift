//
//  Sound.swift
//  RPG-Builder
//
//  Created by Piotr Szadkowski on 15/03/2020.
//  Copyright © 2020 Piotr Szadkowski. All rights reserved.
//

import SwiftUI

let sounds: [Sound] = [.init(name: "Magic Spell", category: .magic, imageName: "wand.and.stars"),
                       .init(name: "Magic Spell", category: .magic, imageName: "wand.and.stars"),
                       .init(name: "Magic Spell", category: .magic, imageName: "wand.and.stars"),
                       .init(name: "Magic Spell", category: .magic, imageName: "wand.and.stars"),
                       .init(name: "Magic Spell", category: .magic, imageName: "wand.and.stars")
//                       .init(name: "People Talking", category: .tavern, imageName: "quote.bubble.fill"),
//                       .init(name: "Man writing", category: .tool, imageName: "scribble")
                    ]

struct Sound: Codable, Hashable, Identifiable {
    let id = UUID()
    let name: String
    let category: Category
    fileprivate let imageName: String
    let audioData: Data? = nil
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case magic = "Magic"
        case nature = "Nature"
        case tavern = "Tavern"
        case tool = "Tool"
        
        var gradient: Gradient {
            switch self {
            case .magic:
                return Gradient(colors: [.init(UIColor(named: "magicBlue")!), .init(UIColor(named: "magicGreen")!)])
            case .tavern:
                return Gradient(colors: [.init(.brown), .init(.black)])
            default:
                return Gradient(colors: [.init(.green), .init(.orange)])
            }
        }
        
        var mainColor: Color {
            return Color(UIColor(named: "magicBlue")!)
        }
        
    }
    
}

extension Sound {
    
    var image: Image {
        Image(systemName: imageName)
    }
    
}
