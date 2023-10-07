//
//  ChallengeRowView.swift
//  Fish
//
//  Created by Jia Chen Yee on 7/10/23.
//

import SwiftUI

struct ChallengeRowView: View {
    
    var challenge: Challenge
    @Binding var timesCompleted: Int
    
    var onDelete: (() -> Void)
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 0) {
                Image(systemName: challenge.systemImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24)
                    .foregroundStyle(challenge.accentColor)
                    .frame(width: 36, alignment: .leading)
                
                Text(challenge.title)
                
                Spacer()
                
                Image(systemName: "bolt.fill")
                    .imageScale(.small)
                    .scaleEffect(0.8)
                    .foregroundStyle(.gray)
                Text("\(challenge.reward)")
                    .foregroundStyle(.gray)
            }
            .font(.title2)
            .fontWeight(.bold)
            
            Text(challenge.description)
            
            Rectangle()
                .frame(height: 1)
                .padding(.vertical, 8)
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<challenge.completionItems, id: \.self) { index in
                        if index < timesCompleted {
                            ZStack {
                                Circle()
                                    .fill(challenge.accentColor)
                                    .frame(width: 32, height: 32)
                                Image(systemName: "checkmark")
                                    .bold()
                                    .foregroundStyle(.white)
                            }
                        } else {
                            ZStack {
                                Circle()
                                    .stroke(challenge.accentColor, lineWidth: 3)
                                    .padding(1.5)
                                    .frame(width: 32, height: 32)
                                Text("\(index + 1)")
                                    .bold()
                                    .foregroundStyle(challenge.accentColor)
                            }
                        }
                    }
                }
            }
        }
        .padding()
        .background(.thickMaterial.opacity(0.98))
        .background(.black)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .onTapGesture {
            withAnimation {
                timesCompleted += 1
            }
            
            if timesCompleted == 3 {
                onDelete()
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    ChallengeRowView(challenge: .sleep, timesCompleted: .constant(1)) {
        
    }
}
