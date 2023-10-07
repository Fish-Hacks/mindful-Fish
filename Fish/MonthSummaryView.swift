//
//  MonthSummaryView.swift
//  Fish
//
//  Created by Jia Chen Yee on 7/10/23.
//

import SwiftUI

struct MonthSummaryView: View {
    
    @State private var index = 0
    
    var body: some View {
        TabView(selection: $index) {
            ZStack {
                Color.green
                
                Text("January Summary")
                    .font(.system(size: 64, weight: .bold))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                    .padding(.bottom)
            }
            
            ZStack {
                Color.blue
                VStack {
                    Text("Mood of\nthe Month")
                        .font(.system(size: 64, weight: .bold))
                    Text("You logged 12 days as sad and 2 days as happy")
                        .font(.system(size: 24, weight: .bold))
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            }
            
            Color.yellow
            
            Color.cyan
            
            Color.indigo
        }
        .tabViewStyle(.page)
        .onTapGesture {
            withAnimation {
                index += 1
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    MonthSummaryView()
}
