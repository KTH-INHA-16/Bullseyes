//
//  BackgroundView.swift
//  Bullseye
//
//  Created by 김태훈 on 2022/05/19.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game
    
    var body: some View {
        VStack {
            TopView(game: $game)
            
            Spacer()
            
            BottomView(game: $game)
        }
        .padding()
        .background {
            RingsView()
        }
    }
}

struct TopView: View {
    @Binding var game: Game
    @State private var leaderboardIsShowing = false
    
    var body: some View {
        HStack {
            Button(action: {
                game.restart()
            }) {
                RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            }
            
            Spacer()
            
            
            Button(action: {
                leaderboardIsShowing = true
            }) {
                RoundedImageViewFilled(systemName: "list.dash")
            }
            .sheet(isPresented: $leaderboardIsShowing, onDismiss: {}, content: {
                LeaderboradView(leaderboardIsShowing: $leaderboardIsShowing, game: $game)
            })
        }
    }
}

struct BottomView: View {
    @Binding var game: Game
    
    var body: some View {
        HStack {
            NumberView(title: "score".uppercased(), text: String(game.score))
            
            Spacer()
            
            NumberView(title: "round".uppercased(), text: String(game.round))
        }
    }
}

struct NumberView: View {
    var title: String
    var text: String
    
    var body: some View {
        VStack {
            LabelText(text: title)
            
            RoundRectTextView(text: text)
        }
    }
}

struct RingsView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var range = 1..<6
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
        
            ForEach(range, id: \.self) { ring in
                let size = CGFloat(ring) * 100
                let opacity = colorScheme == .dark ? 0.1 : 0.3
                
                Circle()
                    .stroke(lineWidth: 20)
                    .fill(
                        RadialGradient(gradient: Gradient(colors: [Color("RingsColor").opacity(opacity * 0.8), Color("RingsColor").opacity(0.0)]), center: .center, startRadius: 100, endRadius: 300)
                    )
                    .frame(width: size, height: size)
    
            }
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(.init()))
        BackgroundView(game: .constant(.init()))
            .preferredColorScheme(.dark)
    }
}
