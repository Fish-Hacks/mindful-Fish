//
//  TodayArticle.swift
//  Fish
//
//  Created by Jia Chen Yee on 7/10/23.
//

import Foundation

struct TodayArticle {
    var title: String
    var subtitle: String
    var content: [Section]
    
    struct Section {
        var title: String?
        var description: String
    }
    
    static let sleep = TodayArticle(title: "Getting Enough Sleep", subtitle: "Tips", content: [
        Section(title: "Why is sleep important?", description: "Sleep is essential for your health. It helps your brain and body function properly. Getting enough sleep can help protect your mental health, physical health, quality of life, and safety."),
        Section(title: "How much sleep do I need?", description: "Most adults need 7-8 hours of sleep each night. Teenagers need 8-10 hours of sleep each night. Children need 9-12 hours of sleep each night. Older adults need 7-8 hours of sleep each night."),
        Section(title: "How can I get better sleep?", description: "Try to go to bed and wake up at the same time every day. Avoid caffeine and alcohol before bed. Avoid screens before bed. Make sure your bedroom is dark, quiet, and cool. Avoid naps during the day. Get regular exercise. Avoid large meals before bed.")
    ])
    
    static let jimmy = TodayArticle(title: "Jimmy the Fish", subtitle: "Hear Their Stories", content: [
        Section(title: "“I love water.”", description: "Without water, I would not be alive."),
        Section(title: "I am a fish.", description: "Fishes swim. I swim. Therefore I require water.")
    ])
}

