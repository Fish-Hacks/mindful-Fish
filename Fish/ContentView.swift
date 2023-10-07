//
//  ContentView.swift
//  Fish
//
//  Created by Jia Chen Yee on 6/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    @StateObject var fishRendererManager = FishRendererManager()
    
    var body: some View {
        TabView {
            TodayView()
                .tabItem {
                    Label("Today", systemImage: "newspaper")
                }
            
            FishView()
                .tabItem {
                    Label("My Jimmy", systemImage: "fish")
                }
            
            JournalView()
                .tabItem {
                    Label("Journal", systemImage: "list.bullet")
                }
            
            ChatView()
                .tabItem {
                    Label("Chat", systemImage: "bubble.right.fill")
                }
        }
        .environmentObject(viewModel)
        .environmentObject(fishRendererManager)
    }
}

#Preview {
    ContentView()
}
