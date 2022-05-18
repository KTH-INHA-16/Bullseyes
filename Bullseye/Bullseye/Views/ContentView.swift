//
//  ContentView.swift
//  Bullseye
//
//  Created by 김태훈 on 2022/05/16.
//

import SwiftUI

struct ContentView: View {
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                InstructionsView(game: $game)
                
                SliderView(sliderValue: $sliderValue)
                
                HitMeButton(sliderValue: $sliderValue, game: $game, alertIsVisible: $alertIsVisible)
            }
        }
    }
}

struct InstructionsView: View {
    @Binding var game: Game
    
    var body: some View {
        VStack {
            InstructionText(text: "🎯🎯🎯\nPUT THE BULLSYE AS ClZOSE AS YOU CAN TO")
                .padding(.horizontal, 30.0)
                
            BigNumberText(text: String(game.target))
        }
    }
}

struct SliderView: View {
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            SliderLabelText(text: "1")
            
            Slider(value: $sliderValue, in: 1.0...100.0)
            
            SliderLabelText(text: "100")
        }
        .padding()
    }
}

struct HitMeButton: View {
    @Binding var sliderValue: Double
    @Binding var game: Game
    @Binding var alertIsVisible: Bool
    
    var body: some View {
        Button(action: {
            self.alertIsVisible = true
        }) {
            Text("hit me".uppercased())
            .bold()
            .font(.title3)
        }
        .padding(20.0)
        .foregroundColor(.white)
        .background(
            ZStack {
                Color("ButtonColor")
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
            }
        )
        .cornerRadius(21)
        .overlay {
            RoundedRectangle(cornerRadius: 21.0)
                .strokeBorder(.white, lineWidth: 2.0)
        }
        .alert("Hello there!", isPresented: $alertIsVisible) {
          Button("Awesome!") { }
        } message: {
            let roundedValue = Int(sliderValue.rounded())
            Text("The slider's value is \(roundedValue).\n You scored \(game.points(sliderValue: roundedValue)) points this round.")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
