//
//  ContentView.swift
//  RPG-Builder
//
//  Created by Piotr Szadkowski on 15/03/2020.
//  Copyright © 2020 Piotr Szadkowski. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let categories = sounds
        .map { $0.category }
        .removingDuplicates()
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    ForEach(categories, id: \.self) { category in
                        VStack(alignment: .leading) {
                            Text(category.rawValue)
                                .font(.title)
                                .padding()
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(sounds.filter {
                                        $0.category == category
                                    }) { sound in
                                        Text("XD")
                                    }
                                }
                            }
                        }
                    }
                }
                .navigationBarTitle(Text("Your Sounds"))
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()

        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }

    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}
