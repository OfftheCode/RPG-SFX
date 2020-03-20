//
//  SoundOption.swift
//  RPG-SFX
//
//  Created by Piotr Szadkowski on 20/03/2020.
//  Copyright © 2020 Piotr Szadkowski. All rights reserved.
//

import SwiftUI

struct SoundOptions {
    let activeImageName: String
    let inActivteImageName: String
    
    let activeColor: Color
    let inactiveColor: Color = Color(#colorLiteral(red: 0.4391798675, green: 0.4392358959, blue: 0.4391607642, alpha: 1))
}

extension SoundOptions {
    static let heart = SoundOptions(activeImageName: "heart.fill", inActivteImageName: "heart", activeColor: Color.pink)
    
    static let `repeat` = SoundOptions(activeImageName: "goforward", inActivteImageName: "goforward", activeColor: Color.blue)
}

struct SoundOption: View {
    
    @State var soundOptions: SoundOptions
    @State var currentScale: CGFloat = 1.0
    @Binding var isActive: Bool
    
    var body: some View {
        Image(systemName: isActive ? soundOptions.activeImageName : soundOptions.inActivteImageName)
        .font(.system(size: 36, weight: .semibold))
            .foregroundColor(isActive ? soundOptions.activeColor : soundOptions.inactiveColor)
        .scaleEffect(currentScale)
        .animation(.spring())
        .onTapGesture {
            self.isActive.toggle()
            self.currentScale = 1.2
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.currentScale = 1.0
            }
        }
    }
}

struct SoundOption_Previews: PreviewProvider {
    static var previews: some View {
        SoundOption(soundOptions: SoundOptions.heart, isActive: .constant(false))
    }
}
