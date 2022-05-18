//
//  TextUIViews.swift
//  Bullseye
//
//  Created by 김태훈 on 2022/05/18.
//

import SwiftUI

struct InstructionText: View {
    let text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4)
            .font(.footnote)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigNumberText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .kerning(-1)
            .foregroundColor(Color("TextColor"))
            .font(.largeTitle)
            .fontWeight(.black)
    }
}

struct SliderLabelText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(Color("TextColor"))
            .bold()
    }
}

struct TextUIViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionText(text: "🎯🎯🎯\nPUT THE BULLSYE AS ClZOSE AS YOU CAN TO")
            BigNumberText(text: "89")
        }
    }
}
