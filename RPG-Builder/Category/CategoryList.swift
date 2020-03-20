//
//  CategoryList.swift
//  RPG-SFX
//
//  Created by Piotr Szadkowski on 20/03/2020.
//  Copyright © 2020 Piotr Szadkowski. All rights reserved.
//

import SwiftUI

struct CategoryList: View {
    var body: some View {
        TabView {
            NavigationView {
                List(categories) { category in
                    Text("xd")
                }
                .navigationBarTitle("Categories")
            }.tabItem {
                Image(systemName: "list.dash")
                Text("Categories")
            }

        }
    }
}

struct CategoryList_Previews: PreviewProvider {
    static var previews: some View {
        CategoryList()
    }
}
