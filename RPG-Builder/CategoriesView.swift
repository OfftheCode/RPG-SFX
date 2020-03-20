//
//  ContentView.swift
//  RPG-Builder
//
//  Created by Piotr Szadkowski on 15/03/2020.
//  Copyright © 2020 Piotr Szadkowski. All rights reserved.
//

import SwiftUI

struct CategoriesView: View {
    
    private let audioManager: AudioManager
    
    init(audioManager: AudioManager = AudioManager()) {
        self.audioManager = audioManager
    }
    
    
    var body: some View {
        NavigationView {
            List(categories) { category in
                Text("\(category.title)")
            }.navigationBarTitle(Text("Categories"))
        }
    }
}

//.listRowInsets(EdgeInsets())

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
