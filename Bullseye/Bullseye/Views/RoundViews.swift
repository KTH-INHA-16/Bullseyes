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
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedRectViewHeight)
            .overlay {
                Circle()
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth, antialiased: true)
            }
    }
}

struct RoundedImageViewFilled: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedRectViewHeight)
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
            .frame(width: Constants.General.roundedRectViewWidth, height: Constants.General.roundedRectViewHeight)
            .foregroundColor(Color("TextColor"))
            .overlay {
                RoundedRectangle(cornerRadius: Constants.General.roundedRectCornerRadius)
                    .stroke(lineWidth: Constants.General.strokeWidth)
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
