//
//  SoundView.swift
//  RPG-SFX
//
//  Created by Piotr Szadkowski on 20/03/2020.
//  Copyright © 2020 Piotr Szadkowski. All rights reserved.
//

import SwiftUI

struct SoundView: View {
    
    @State var sound: Sound
    @State var currentHeartScale: CGFloat = 1.0
    @State var currentRepeatScale: CGFloat = 1.0
    
    private let iconColor = Color(#colorLiteral(red: 0.4391798675, green: 0.4392358959, blue: 0.4391607642, alpha: 1))
    private let titleColor = Color(#colorLiteral(red: 0.1529260874, green: 0.1529496312, blue: 0.1529181004, alpha: 1))
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(sound.name)")
                .font(.system(size: 36, weight: .regular))
                .foregroundColor(titleColor)
                .padding(.bottom, 16)
                HStack {
                    ForEach(sound.tags.prefix(2), id: \.self) { tag in
                        TagView(tag: tag)
                    }
                }
            }
            Spacer()
            VStack(spacing: 20) {
                SoundOption(soundOptions: .heart, isActive: $sound.isFavourite)
                SoundOption(soundOptions: .repeat, isActive: $sound.isLooping)
            }
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 22)
        .background(Color.white)
        .cornerRadius(27)
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
    }
}

struct SoundView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SoundView(sound: sounds[0])
            SoundView(sound: sounds[1])
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
