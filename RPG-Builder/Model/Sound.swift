//
//  Sound.swift
//  RPG-Builder
//
//  Created by Piotr Szadkowski on 15/03/2020.
//  Copyright © 2020 Piotr Szadkowski. All rights reserved.
//

import SwiftUI

struct Sound: Codable, Hashable, Identifiable {
    let id = UUID()
    let name: String
    var tags: [Tag] = []
    var categoryType: CategoryType
    var isFavourite: Bool = false
    var isLooping: Bool = false
}

enum Tag: String, Codable, CaseIterable {
    case food
    case human
    case building
    
    var title: String {
        self.rawValue.capitalized
    }
}


enum CategoryType: String, CaseIterable, Codable {
    case tavern = "Tavern"
}

struct Category: Codable, Hashable, Identifiable {
    let id = UUID()
    let categoryType: CategoryType
    let description: String
    var tags: [Tag]
    var imageName: String
    
    var title: String {
        return categoryType.rawValue
    }
    
    var image: Image {
        return Image(imageName)
    }
}

let categories: [Category] = [Category(categoryType: .tavern, description: "Here you can play sounds from tavern. Singing, drinking and dancing that’s what You might encounter while drinking before you quest.", tags: [.building], imageName: "tavern")]

let sounds: [Sound] = [
    Sound(name: "Beer drinking", tags: [.food], categoryType: .tavern),
    Sound(name: "Drunk man", tags: [.human], categoryType: .tavern, isFavourite: true)
]

let tavernSounds = sounds.filter {
    $0.categoryType == .tavern
}
