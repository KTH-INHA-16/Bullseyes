//
//  RoundViews.swift
//  Bullseye
//
//  Created by 김태훈 on 2022/05/18.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: 56, height: 56)
            .overlay {
                Circle()
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2.0, antialiased: true)
            }
    }
}

struct RoundedImageViewFilled: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .frame(width: 56, height: 56)
            .foregroundColor(Color("ButtonFillTextColor"))
            .background {
                Circle()
                    .fill(Color("ButtonFillBackgroundColor"))
            }
    }
}

struct RoundRectTextView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .kerning(-0.2)
            .bold()
            .font(.title3)
            .frame(width: 68, height: 56)
            .foregroundColor(Color("TextColor"))
            .overlay {
                RoundedRectangle(cornerRadius: 21)
                    .stroke(lineWidth: 2)
                    .foregroundColor(Color("ButtonStrokeColor"))
            }

    }
}

struct RoundViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 10) {
            RoundedImageViewStroked(systemName: "arrow.clockwise")
                .preferredColorScheme(.light)
            RoundedImageViewFilled(systemName: "arrow.clockwise")
                .preferredColorScheme(.dark)
            RoundRectTextView(text: "999")
        }
    }
}
