//
//  MonthsSummaryPointsEarned.swift
//  Fish
//
//  Created by Jia Chen Yee on 7/10/23.
//

import Foundation
import SwiftUI

struct MonthsSummaryPointsEarned: View {
    
    var index: Int
    
    @State private var boltScale = 0.6
    
    var body: some View {
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
                        .scaleEffect(boltScale)
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
        .onChange(of: index) { newValue in
            if newValue == 2 {
                withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.5).delay(0.5)) {
                    boltScale = 1
                }
            } else {
                boltScale = 0.6
            }
        }
    }
}
