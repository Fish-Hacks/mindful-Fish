//
//  MonthSummaryView.swift
//  Fish
//
//  Created by Jia Chen Yee on 7/10/23.
//

import SwiftUI

struct MonthSummaryView: View {
    
    @EnvironmentObject var fishRendererManager: FishRendererManager
    
    @State private var index = 0
    
    var body: some View {
        TabView(selection: $index) {
            MonthsSummaryCoverView()
                .tag(0)
            
            MonthsSummaryMoodOfMonth(index: index)
                .tag(1)
            
            MonthsSummaryPointsEarned(index: index)
                .tag(2)
            
            MonthsSummaryTrendsView()
                .tag(3)
            
            ZStack {
                Color.cyan
                    .ignoresSafeArea()
                
                GeometryReader { _ in
                    Image(systemName: "lightbulb")
                        .font(.system(size: 329))
                        .rotationEffect(.degrees(25))
                        .opacity(0.15)
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        .offset(x: 128)
                }
                .clipped()
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Advice")
                        .font(.system(size: 24, weight: .bold))
                    ScrollView {
                        Text("**Practice mindfulness meditation:** Mindfulness meditation can help you become more aware of your thoughts and feelings, allowing you to manage them better. You can start with short sessions (5-10 minutes)")
                            .font(.system(size: 32, weight: .regular))
                    }
                    .padding(.bottom)
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            }
            .tag(4)
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
