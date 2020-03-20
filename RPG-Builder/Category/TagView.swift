//
//  TagView.swift
//  RPG-SFX
//
//  Created by Piotr Szadkowski on 20/03/2020.
//  Copyright © 2020 Piotr Szadkowski. All rights reserved.
//

import SwiftUI

struct TagView: View {
    
    var tag: Tag
    @State var isShorten: Bool = false
    
    var body: some View {
        Text(isShorten ? "" : "\(tag.title)")
        .font(.custom("Helvetica Neue", size: 13))
        .bold()
        .shadow(radius: 5)
        .foregroundColor(.white)
        .padding(.vertical, isShorten ? 0 : 7)
        .padding(.horizontal, isShorten ? 0 : 18)
        .frame(maxWidth: isShorten ? 20 : nil)
        .frame(maxHeight: isShorten ? 20 : nil)
        .background(LinearGradient(gradient: Gradient(colors: tag.colors), startPoint: .init(x: 0.0, y: 0.5), endPoint: .init(x: 1.0, y: 0.5)))
        .cornerRadius(isShorten ? 10 : 9)
        .animation(.easeInOut)
        .onTapGesture {
            self.isShorten.toggle()
        }
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TagView(tag: .building)
            TagView(tag: .building, isShorten: true)
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}

fileprivate extension Tag {
    var colors: [Color] {
        switch self {
        case .building:
            return [Color(#colorLiteral(red: 0, green: 1, blue: 0.4276379943, alpha: 1)),Color(#colorLiteral(red: 0.4615605474, green: 0.719222486, blue: 0, alpha: 1))]
        case .food:
            return [Color(#colorLiteral(red: 1, green: 0.1600520313, blue: 0.2995818257, alpha: 1)),Color(#colorLiteral(red: 0.5317994952, green: 0.3427904248, blue: 1, alpha: 1))]
        case .human:
            return [Color(#colorLiteral(red: 1, green: 0.2612745464, blue: 0.3848263621, alpha: 1)),Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1))]
        }
    }
}
