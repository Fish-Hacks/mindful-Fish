//
//  ViewModel.swift
//  Fish
//
//  Created by Jia Chen Yee on 7/10/23.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var challenges = [
        ChallengeData(challenge: .sleep, timesCompleted: 0),
        ChallengeData(challenge: .moodLog, timesCompleted: 0)
    ]
    
    @Published var brineShrimp = 0 {
        didSet {
            let newFishLocation = Int(floor(Double(brineShrimp) / 10))
            
            let iterations = abs(newFishLocation - fishLocation)
            var iteration = 1
            
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
                if iterations == iteration {
                    timer.invalidate()
                    return
                }
                
                withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.5)) {
                    self.fishLocation += 1
                }
                
                iteration += 1
            }
            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.5)) {
                fishLocation += 1
            }
        }
    }
    
    @Published var fishLocation = 0
}
