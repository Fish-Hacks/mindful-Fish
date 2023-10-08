//
//  Message.swift
//  Fish
//
//  Created by Jia Chen Yee on 7/10/23.
//

import Foundation
import SwiftUI

struct Message: Identifiable {
    var sender: Sender
    var message: String
    var id = UUID()
    
    enum Sender {
        case jimmy
        case user
        
        var description: String {
            switch self {
            case .jimmy: "Jimmy"
            case .user: "You"
            }
        }
        
        var image: Image {
            switch self {
            case .jimmy: Image(.fishIcon)
            case .user: Image(systemName: "person.circle.fill")
            }
        }
    }
}
