//
//  TodayArticle.swift
//  Fish
//
//  Created by Jia Chen Yee on 7/10/23.
//

import Foundation
import SwiftUI

struct TodayArticle {
    var title: String
    var subtitle: String
    var content: [Section]
    var image: Image
    
    struct Section {
        var title: String?
        var description: String
    }
    
    static let sleep = TodayArticle(title: "Why Sleep Is So Important.", subtitle: "Health Articles", content: [
        Section(title: "Why is sleep important?", description: "Sleep is essential for your health. It helps your brain and body function properly. Getting enough sleep can help protect your mental health, physical health, quality of life, and safety."),
        Section(title: "How much sleep do I need?", description: "Most adults need 7-8 hours of sleep each night. Teenagers need 8-10 hours of sleep each night. Children need 9-12 hours of sleep each night. Older adults need 7-8 hours of sleep each night."),
        Section(title: "How can I get better sleep?", description: "Try to go to bed and wake up at the same time every day. Avoid caffeine and alcohol before bed. Avoid screens before bed. Make sure your bedroom is dark, quiet, and cool. Avoid naps during the day. Get regular exercise. Avoid large meals before bed.")
    ], image: Image(.bed))
    
    static let jimmy = TodayArticle(title: "See Jia Chen’s inspiring story.", subtitle: "Human Library", content: [
        Section(title: "“The desire to experiment with new ideas and create something unique has always been a part of me.”", description: "Jia Chen has always been fascinated by the intersection of science and technology. As a child growing up in Singapore, his family encouraged him to play STEM-based games. And with his first iPhone, his passion for technology exploded."),
        Section(title: "“When I was just 11 years old, my entire world was transformed by the incredible capabilities of mobile apps.”", description: """
                That was all the inspiration Jia Chen needed to bring his own ideas to life, through apps. He learned to code using Swift on Mac — just two years later, he developed and published his first iOS app on the App Store.
                
                I found Swift programming language much easier to learn than Java,” says Jia Chen. “It’s simpler and more straightforward.”
                
                Today, Jia Chen’s life revolves around building solutions with the technology he loves. He studies advanced user-experience design, end-to-end development, and entrepreneurship at Ngee Ann Polytechnic. For his projects, he uses iPad to sketch app designs in Freeform and ideates with Swift Playgrounds before jumping onto Mac to develop with Xcode.
                """),
        Section(title: "Write Your Story", description: "Write your own path anad create your own story.")
    ], image: Image(.jiaChen))
}

