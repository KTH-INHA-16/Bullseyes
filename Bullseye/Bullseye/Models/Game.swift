//
//  Game.swift
//  Bullseye
//
//  Created by 김태훈 on 2022/05/18.
//

import Foundation

struct Game {
    var target: Int = .random(in: 1...100)
    var score = 0
    var round = 1
    
    func points(sliderValue: Int) -> Int {
        100 - abs(target - sliderValue)
    }
}
