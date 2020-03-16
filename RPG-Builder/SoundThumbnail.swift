//
//  SoundThumbnail.swift
//  RPG-Builder
//
//  Created by Piotr Szadkowski on 16/03/2020.
//  Copyright © 2020 Piotr Szadkowski. All rights reserved.
//

import SwiftUI

struct SoundThumbnail: View {
    
    var sound: Sound
    
    var body: some View {
        VStack {
            Text(sound.name)
                .font(.system(size: 18, weight: .heavy))
                .padding(.bottom, 12)
                .shadow(radius: 10)
            sound.image
                .imageScale(.large)
                .font(.system(size: 22, weight: .bold))
        }
        .foregroundColor(Color.white)
        .frame(height: 120)
        .padding()
        .background(
            LinearGradient(
                gradient: sound.category.gradient,
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .cornerRadius(30)
        .shadow(color: sound.category.mainColor, radius: 10, x: 0, y: 10)
    }
}

struct SoundThumbnail_Previews: PreviewProvider {
    static var previews: some View {
        SoundThumbnail(sound: sounds[0])
            .previewLayout(.sizeThatFits)
            .padding()
            .previewDisplayName("Sound")
            
    }
}
