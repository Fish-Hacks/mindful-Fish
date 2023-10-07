//
//  FishView.swift
//  Fish
//
//  Created by Jia Chen Yee on 7/10/23.
//

import SwiftUI
import SceneKit

struct FishView: View {
    
    @StateObject var fishRendererManager = FishRendererManager()
    
    @State private var drawerHeight = 64.0
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                ScrollView {
                    ScrollViewReader { proxy in
                        ZStack {
                            let firstElement = CGPoint(x: 722.0 / 1179.0, y: 1784 / 2556)
                            
                            Image(.samplePath)
                                .resizable()
                                .frame(width: geometry.size.width, height: geometry.size.width * 2556 / 1179)
                            
                            FishSceneView(fishRendererManager: fishRendererManager)
                                .frame(width: 200, height: 200)
                                .position(getPoint(for: 0, frameWidth: geometry.size.width))
                        }
                    }
                }
                .padding(.top, 128)
                .background(
                    Image(.gradientStrip)
                        .resizable()
                )
            }
            .clipped()
            .ignoresSafeArea(.container, edges: .top)
            .padding(.bottom, drawerHeight - 16)
            
            VStack {
                VStack {
                    Text("Location 1")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Coral Reef")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fontWeight(.bold)
                    
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.secondary)
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundStyle(.blue)
                            .frame(width: geometry.size.width * 0.7)
                    }
                    .frame(height: 16)
                }
                .padding()
                .background(.thickMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding()
                
                Spacer()
                
                ChallengesView(height: $drawerHeight)
            }
        }
    }
    
    
    func getPoint(for positionIndex: Int, frameWidth: Double) -> CGPoint {
        let unit = frameWidth / 1179
        let yOffset = Double(positionIndex) * unit * 150
        
        let xOffsets = [
            0,
            300 * unit,
            2 * 300 * unit,
            300 * unit
        ]
        
        let xOffset = xOffsets[positionIndex % xOffsets.count]
        
        return CGPoint(x: 872 * unit - xOffset,
                       y: 1935 * unit - yOffset)
    }
}

#Preview {
    FishView()
}
