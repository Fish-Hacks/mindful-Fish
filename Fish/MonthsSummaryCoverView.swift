//
//  MonthsSummaryCoverView.swift
//  Fish
//
//  Created by Jia Chen Yee on 7/10/23.
//

import SwiftUI

struct MonthsSummaryCoverView: View {
    
    @EnvironmentObject var fishRendererManager: FishRendererManager
    
    var body: some View {
        ZStack {
            Color.red.opacity(0.6)
                .background(.white)
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Text("September’s Summary")
                    .font(.system(size: 54, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                HStack(spacing: -64) {
                    Image(systemName: "calendar")
                        .symbolRenderingMode(.multicolor)
                        .resizable()
                        .scaledToFit()
                        .rotationEffect(.degrees(-15))
                    
                    FishSceneView(fishRendererManager: fishRendererManager)
                        .rotationEffect(.degrees(20))
                }
            }
            .padding()
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    MonthsSummaryCoverView()
}
