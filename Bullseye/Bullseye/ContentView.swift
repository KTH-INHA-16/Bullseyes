//
//  ContentView.swift
//  Bullseye
//
//  Created by 김태훈 on 2022/05/16.
//

import SwiftUI

struct ContentView: View {
    @State private var alertIsVisible: Bool = false
    
    var body: some View {
        VStack {
            Text("🎯🎯🎯\nPUT THE BULLSYE AS ClZOSE AS YOU CAN TO")
                .bold()
                .kerning(2.0)
                .multilineTextAlignment(.center)
                .lineSpacing(4)
                .font(.footnote)
                
            Text("89")
                .kerning(-1)
                .font(.largeTitle)
                .fontWeight(.black)
            
            HStack {
                Text("1")
                    .bold()
                
                Slider(value: .constant(50), in: 1.0...100.0)
                
                Text("100")
                    .bold()
            }
            
            Button(action: {
                self.alertIsVisible = true
            }) {
                Text("Hit Me")
            }
            .alert("Hello there!", isPresented: $alertIsVisible) {
              Button("Awesome!") { }
            } message: {
                Text("This is my first pop-up")
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
