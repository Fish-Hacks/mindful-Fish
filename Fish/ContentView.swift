//
//  ContentView.swift
//  Fish
//
//  Created by Jia Chen Yee on 6/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            FishView()
                .tabItem {
                    Label("My Jimmy", systemImage: "fish")
                }
            
            LogView()
                .tabItem {
                    Label("Logs", systemImage: "list.bullet")
                }
            
            Text("")
                .tabItem {
                    Label("Support", systemImage: "phone")
                }
        }
    }
}

#Preview {
    ContentView()
}
