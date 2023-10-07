//
//  ChallengeData.swift
//  Fish
//
//  Created by Jia Chen Yee on 7/10/23.
//

import Foundation

struct ChallengeData: Identifiable {
    var challenge: Challenge
    var timesCompleted: Int
    
    var id = UUID()
}
