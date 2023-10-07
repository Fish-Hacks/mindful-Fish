//
//  MonthsSummaryMoodOfMonth.swift
//  Fish
//
//  Created by Jia Chen Yee on 7/10/23.
//

import SwiftUI

struct MonthsSummaryMoodOfMonth: View {
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Image(.cry)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 128, height: 128)
                Text("Mood of\nthe Month")
                    .font(.system(size: 64, weight: .bold))
                    .padding(.bottom)
                Text("You logged 12 days as sad and 2 days as happy")
                    .font(.system(size: 24, weight: .regular))
            }
            .foregroundStyle(.white)
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
        }
    }
}

#Preview {
    MonthsSummaryMoodOfMonth()
}
