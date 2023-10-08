//
//  ViewModel.swift
//  Fish
//
//  Created by Jia Chen Yee on 7/10/23.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    
    let ip = "192.168.34.162:5000"
    
    @Published var messages: [Message] = [
        Message(sender: .jimmy, message: "Hi I’m Jimmy! How are you?")
    ]
    
    var responseIndex = 0
    
    let responses = [
        "I'm sorry to hear that you're feeling this way about your exams. It's completely natural to feel disappointed or upset after experiencing a setback. Let's talk about it. How are you feeling about the situation, and what thoughts are going through your mind right now?",
        """
I'm sorry to hear that you're feeling this way. It's understandable to feel disappointed and to be concerned about how others, especially those close to you, might react. Remember, everyone faces setbacks at some point in their lives, and it's okay to feel the way you do right now.

When it comes to your parents, have you spoken to them about your results yet? Sometimes our fears and assumptions about how others will react can be more intense than the actual reactions themselves. It might be helpful to have an open conversation with them about your feelings and concerns. They may offer support and understanding that you might not be expecting.

Additionally, it's essential to remember that one exam or even a series of exams doesn't define your worth or potential. There are always opportunities to learn, grow, and improve. Would you like to discuss strategies or ways to cope with this setback and plan for the future?
"""
    ]
    
    @Published var challenges = [
        ChallengeData(challenge: .sleep, timesCompleted: 0),
        ChallengeData(challenge: .moodLog, timesCompleted: 0),
        ChallengeData(challenge: .workout, timesCompleted: 0)
    ]
    
    @Published var logs: [Log] = Log.sample
    
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
    
    func sendMessage(_ message: String) {
        withAnimation {
            messages.append(.init(sender: .user, message: message))
        }
        
        Task {
            var request = URLRequest(url: URL(string: "http://\(ip)/chat/Yun-E")!)
            request.httpMethod = "POST"
            
            let encoder = JSONEncoder()
            let data = try! encoder.encode(SendMessageData(message: message))
            
            request.httpBody = data
            
            let (outputData, result) = try! await URLSession.shared.data(for: request)
            
            if let string = String(data: outputData, encoding: .utf8) {
                messages.append(.init(sender: .jimmy, message: string))
            } else {
                print(result)
            }
        }
    }
}

struct SendMessageData: Codable {
    var message: String
}
