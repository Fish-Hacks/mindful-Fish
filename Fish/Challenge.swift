//
//  Challenge.swift
//  Fish
//
//  Created by Jia Chen Yee on 7/10/23.
//

import Foundation
import SwiftUI

struct Challenge {
    var title: String
    var description: String
    var systemImage: String
    var accentColor: Color
    var completionItems: Int
    var reward: Int
    
    static let sleep = Challenge(title: "Get some rest!", description: "Get 8 hours of sleep 3 times this week.", systemImage: "bed.double.fill", accentColor: .teal, completionItems: 3, reward: 40)
    
    static let moodLog = Challenge(title: "How do you feel?", description: ("Log your mood every day this week!"), systemImage: "list.bullet", accentColor: .orange, completionItems: 7, reward: 50)
    
    static let workout = Challenge(title: "Take a jog!", description: ("Record 2 15-minute workouts this week!"), systemImage: "figure.run", accentColor: .green, completionItems: 2, reward: 50)
}
