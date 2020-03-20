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
        Text("Witam")
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
