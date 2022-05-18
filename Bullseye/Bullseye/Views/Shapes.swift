//
//  Shapes.swift
//  Bullseye
//
//  Created by 김태훈 on 2022/05/18.
//

import SwiftUI

struct Shapes: View {
    var body: some View {
        VStack {
            Circle()
                .strokeBorder(.blue, lineWidth: 20)
                .frame(width: 200, height: 100)
        }
        .background(.green)
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
