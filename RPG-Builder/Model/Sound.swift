//
//  Sound.swift
//  RPG-Builder
//
//  Created by Piotr Szadkowski on 15/03/2020.
//  Copyright © 2020 Piotr Szadkowski. All rights reserved.
//

import Foundation

let sounds: [Sound] = [.init(name: "Axe hit", category: .weapon),
                       .init(name: "Bow shoot", category: .weapon),
                       .init(name: "Beer drinking", category: .tavern)
                    ]

struct Sound: Codable, Hashable, Identifiable {
    let id = UUID()
    let name: String
    let category: Category
    let audioData: Data? = nil
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case fight = "Fight"
        case weapon = "Weapon"
        case nature = "Nature"
        case tavern = "Tavern"
    }
}
