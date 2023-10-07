//
//  MonthsSummaryTrendsView.swift
//  Fish
//
//  Created by Jia Chen Yee on 7/10/23.
//

import SwiftUI

struct MonthsSummaryTrendsView: View {
    var body: some View {
        ZStack {
            Color.indigo
                .ignoresSafeArea()
            
            GeometryReader { _ in
                Image(systemName: "bed.double")
                    .font(.system(size: 329))
                    .rotationEffect(.degrees(15))
                    .opacity(0.3)
                    .frame(maxHeight: .infinity, alignment: .top)
                    .offset(x: -128)
            }
            .clipped()
            
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "arrowtriangle.up.fill")
                        .foregroundStyle(.green)
                    Text("Sleep")
                }
                .font(.system(size: 32, weight: .bold))
                
                Text("You've gotten more sleep this month!")
                    .font(.system(size: 48, weight: .bold))
                    .padding(.bottom)
                
                Text("From an average of 5 hours last month to 8 hours this month.")
                    .font(.system(size: 24, weight: .regular))
            }
            .foregroundStyle(.white)
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
        }
    }
}

#Preview {
    MonthsSummaryTrendsView()
}
