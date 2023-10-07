//
//  ViewModel.swift
//  Fish
//
//  Created by Jia Chen Yee on 7/10/23.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var challenges = [
        ChallengeData(challenge: .sleep, timesCompleted: 0),
        ChallengeData(challenge: .moodLog, timesCompleted: 0)
    ]
    
    @Published var brineShrimp = 0
}
