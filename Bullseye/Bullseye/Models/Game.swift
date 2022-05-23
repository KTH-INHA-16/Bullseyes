//
//  Game.swift
//  Bullseye
//
//  Created by 김태훈 on 2022/05/18.
//

import Foundation

struct LeaderboardEntry {
    let score: Int
    let date: Date
}

struct Game {
    var target: Int = .random(in: 1...100)
    var score = 0
    var round = 1
    var leaderboardEntries: [LeaderboardEntry] = []
    
    init(loadTestData: Bool = false) {
        if loadTestData {
            for _ in 0..<20 {
                leaderboardEntries.append(LeaderboardEntry(score: 100, date: Date()))
            }
        }
    }
    
    func points(sliderValue: Int) -> Int {
        let difference = abs(target - sliderValue)
        
        return difference == 0 ? 200 : (difference <= 2 ? 150 - difference : 100 - difference)
    }
    
    mutating func addToLeaderboard(point: Int) {
        leaderboardEntries.append(LeaderboardEntry(score: point, date: Date()))
        leaderboardEntries.sort { $0.score > $1.score }
    }
    
    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = .random(in: 1...100)
        addToLeaderboard(point: points)
    }
    
    mutating func restart() {
        target = .random(in: 1...100)
        score = 0
        round = 1
    }
}
