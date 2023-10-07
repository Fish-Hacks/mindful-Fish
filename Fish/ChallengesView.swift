//
//  ChallengesView.swift
//  Fish
//
//  Created by Jia Chen Yee on 7/10/23.
//

import SwiftUI

struct ChallengesView: View {
    
    @Binding var height: Double
    
    @State private var multiplier = 0.5
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 64, height: 4)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                    .background(.black.opacity(0.00001))
                    .gesture(DragGesture(coordinateSpace: .named("ChallengeCoordinate"))
                        .onChanged { value in
                            multiplier = (geometry.size.height - value.location.y) / geometry.size.height
                            
                            if multiplier < 0.15 {
                                multiplier = 0.15
                            } else if multiplier > 1 {
                                multiplier = 1
                            }
                            
                            height = geometry.size.height * multiplier
                        }
                        .onEnded { _ in
                            withAnimation(.easeInOut(duration: 0.2)) {
                                switch multiplier {
                                case 0.75...:
                                    multiplier = 1
                                case 0.25..<0.75:
                                    multiplier = 0.5
                                case ...0.25:
                                    multiplier = 0.15
                                default:
                                    multiplier = 0.15
                                }
                                height = geometry.size.height * multiplier
                            }
                        }
                    )
                VStack(alignment: .leading) {
                    Text("Weekly Challenges")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    ScrollView {
                        ChallengeRowView(challenge: .sleep)
                        ChallengeRowView(challenge: .moodLog)
                            .padding(.bottom)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .frame(height: height, alignment: .top)
            .background(.regularMaterial)
            .clipShape(UnevenRoundedRectangle(topLeadingRadius: 16, topTrailingRadius: 16))
            .frame(maxHeight: .infinity, alignment: .bottom)
            .onAppear {
                height = geometry.size.height * 0.5
            }
        }
        .coordinateSpace(.named("ChallengeCoordinate"))
    }
}

#Preview {
    ChallengesView(height: .constant(0))
}
