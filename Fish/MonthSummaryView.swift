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
            
            MonthsSummaryMoodOfMonth()
                .tag(1)
            
            ZStack {
                Color.yellow
                    .ignoresSafeArea()
                
                GeometryReader { _ in
                    Image(systemName: "list.clipboard")
                        .font(.system(size: 329))
                        .rotationEffect(.degrees(-32))
                        .opacity(0.3)
                        .frame(maxHeight: .infinity, alignment: .top)
                        .offset(x: 128)
                }
                .clipped()
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("30")
                            .font(.system(size: 128, weight: .heavy))
                        Image(systemName: "bolt.fill")
                            .font(.system(size: 64, weight: .heavy))
                            .foregroundStyle(.secondary)
                    }
                    .padding(.bottom, -48)
                    
                    Text("earned")
                        .font(.system(size: 64, weight: .bold))
                        .padding(.bottom)
                    
                    Text("You completed 10 challenges!")
                        .font(.system(size: 24, weight: .regular))
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            }
            .tag(2)
            
            ZStack {
                Color.cyan
                    .ignoresSafeArea()
                VStack(alignment: .leading) {
                    Text("Journal")
                        .font(.system(size: 32, weight: .bold))
                    Text("You indicated XYZ LLM with _ITALIC_ blah")
                        .font(.system(size: 48, weight: .bold))
                        .padding(.bottom)
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            }
            .tag(3)
            
            MonthsSummaryTrendsView()
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
