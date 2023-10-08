//
//  Log.swift
//  Fish
//
//  Created by Jia Chen Yee on 7/10/23.
//

import Foundation
import SwiftUI

struct Log {
    var emotion: Emotion
    var message: String
    var date: Date
    
    init(emotion: Emotion, message: String, iso8601Date: String) {
        self.emotion = emotion
        self.message = message
        self.date = try! Date(iso8601Date, strategy: .iso8601)
    }
    
    enum Emotion: CaseIterable {
        case happy
        case neutral
        case yawn
        case cry
        case angry
        
        var image: Image {
            switch self {
            case .happy: Image(.happy)
            case .neutral: Image(.neutral)
            case .yawn: Image(.yawn)
            case .cry: Image(.cry)
            case .angry: Image(.angry)
            }
        }
        
        var description: String {
            switch self {
            case .happy: "happy"
            case .neutral: "neutral"
            case .yawn: "sleepy"
            case .cry: "cry"
            case .angry: "angry"
            }
        }
        
        var color: Color {
            switch self {
            case .happy: .green
            case .neutral: .yellow
            case .yawn: .indigo
            case .cry: .blue
            case .angry: .red
            }
        }
        
    }
    
    static let sample: [Log] = [
        Log(emotion: .happy, message: "Received a surprise gift", iso8601Date: "2023-10-01T08:30:00Z"),
        Log(emotion: .neutral, message: "Worked on a new project", iso8601Date: "2023-10-02T15:45:00Z"),
        Log(emotion: .yawn, message: "Long day at work", iso8601Date: "2023-10-03T19:20:00Z"),
        Log(emotion: .cry, message: "Bittersweet farewell to a friend", iso8601Date: "2023-10-04T21:10:00Z"),
        Log(emotion: .angry, message: "Missed an important deadline", iso8601Date: "2023-10-05T11:55:00Z"),
        Log(emotion: .happy, message: "Spent quality time with family", iso8601Date: "2023-10-06T17:00:00Z"),
        Log(emotion: .neutral, message: "Visited a new art exhibition", iso8601Date: "2023-10-07T14:30:00Z"),
        Log(emotion: .yawn, message: "Enjoyed a lazy Sunday", iso8601Date: "2023-10-08T10:15:00Z"),
        Log(emotion: .cry, message: "Watched a touching movie", iso8601Date: "2023-10-09T22:05:00Z"),
        Log(emotion: .angry, message: "Stuck in traffic for hours", iso8601Date: "2023-10-10T16:40:00Z"),
        Log(emotion: .happy, message: "Received compliments at work", iso8601Date: "2023-10-11T12:20:00Z"),
        Log(emotion: .neutral, message: "Attended a team-building workshop", iso8601Date: "2023-10-12T09:00:00Z"),
        Log(emotion: .yawn, message: "Late-night coding session", iso8601Date: "2023-10-13T03:30:00Z"),
        Log(emotion: .cry, message: "Said goodbye to a pet", iso8601Date: "2023-10-14T19:45:00Z"),
        Log(emotion: .angry, message: "Computer crashed during a presentation", iso8601Date: "2023-10-15T14:10:00Z"),
        Log(emotion: .happy, message: "Cooked a delicious meal", iso8601Date: "2023-10-16T20:25:00Z"),
        Log(emotion: .neutral, message: "Read a thought-provoking book", iso8601Date: "2023-10-17T13:50:00Z"),
        Log(emotion: .yawn, message: "Early morning flight", iso8601Date: "2023-10-18T05:15:00Z"),
        Log(emotion: .cry, message: "Received sad news from a friend", iso8601Date: "2023-10-19T17:30:00Z"),
        Log(emotion: .angry, message: "Customer service frustration", iso8601Date: "2023-10-20T10:50:00Z"),
        Log(emotion: .happy, message: "Celebrated a friend’s birthday", iso8601Date: "2023-10-21T21:00:00Z"),
        Log(emotion: .neutral, message: "Volunteered at a local charity", iso8601Date: "2023-10-22T16:15:00Z"),
        Log(emotion: .yawn, message: "Hiking in the mountains", iso8601Date: "2023-10-23T12:40:00Z"),
        Log(emotion: .cry, message: "Attended a sad farewell party", iso8601Date: "2023-10-24T18:05:00Z"),
        Log(emotion: .angry, message: "Lost my phone", iso8601Date: "2023-10-25T09:25:00Z"),
        Log(emotion: .happy, message: "Achieved a personal milestone", iso8601Date: "2023-10-26T14:15:00Z"),
        Log(emotion: .neutral, message: "Completed a challenging puzzle", iso8601Date: "2023-10-27T19:50:00Z"),
        Log(emotion: .yawn, message: "Late-night studying for exams", iso8601Date: "2023-10-28T23:30:00Z"),
        Log(emotion: .cry, message: "Said goodbye to a loved one at the airport", iso8601Date: "2023-10-29T07:10:00Z"),
        Log(emotion: .angry, message: "Internet outage during an important call", iso8601Date: "2023-10-30T10:00:00Z"),
        Log(emotion: .happy, message: "Spent a relaxing day at the beach", iso8601Date: "2023-10-31T16:55:00Z")
    ]
}
