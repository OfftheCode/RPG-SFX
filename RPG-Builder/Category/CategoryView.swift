//
//  CategoryView.swift
//  RPG-SFX
//
//  Created by Piotr Szadkowski on 20/03/2020.
//  Copyright © 2020 Piotr Szadkowski. All rights reserved.
//

import SwiftUI

struct CategoryView: View {
    
    private let audioManage = AudioManager()
    
    var category: Category
    let fontName: String = "Helvetica Neue"
    let leadingPadding: CGFloat = 30
    
    @State var sounds: [Sound]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                category.image
                .cornerRadius(36)
                .shadow(radius: 30)
                
                VStack(alignment: .leading) {
                    HStack(alignment: .center) {
                        Text(category.title)
                        .font(.custom(fontName, size: 48))
                        .bold()
                        .foregroundColor(Color(#colorLiteral(red: 0.3190939724, green: 0.3191022575, blue: 0.3190978169, alpha: 1)))
                        
                        ForEach(category.tags.prefix(2), id: \.self) { tag in
                            TagView(tag: tag)
                            .offset(y: 5) // visually better aligned
                        }
                    }
                    
                    Text("\(category.description)")
                        .font(.custom(fontName, size: 18))
                        .padding(.trailing, 59)
                        .padding(.top, 18)
                        .padding(.bottom, 10)
                        .foregroundColor(Color(#colorLiteral(red: 0.3190939724, green: 0.3191022575, blue: 0.3190978169, alpha: 1)))
                }
                .offset(x: 40)
                
                
                ForEach(sounds) { sound in
                    SoundView(sound: sound)
                        .padding(.vertical, 10)
                        .onTapGesture {
                            do {
                                try self.audioManage.play(sound: sound.localSound)
                            } catch let error {
                                print(error.localizedDescription)
                            }
                    }
                }
                .padding(.horizontal, 40)
                
            }
            .offset(y: -100)
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: categories[0], sounds: tavernSounds)
    }
}

extension View {
    var screen: CGSize {
        UIScreen.main.bounds.size
    }
}
