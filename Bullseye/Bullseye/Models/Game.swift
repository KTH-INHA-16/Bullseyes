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
        let difference = abs(target - sliderValue)
        
        return difference == 0 ? 200 : (difference <= 2 ? 150 - difference : 100 - difference)
    }
    
    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = .random(in: 1...100)
    }
    
    mutating func restart() {
        target = .random(in: 1...100)
        score = 0
        round = 1
    }
}
