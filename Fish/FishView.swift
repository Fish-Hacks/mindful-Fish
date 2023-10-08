//
//  FishView.swift
//  Fish
//
//  Created by Jia Chen Yee on 7/10/23.
//

import SwiftUI
import SceneKit

struct FishView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    @EnvironmentObject var fishRendererManager: FishRendererManager
    
    @State private var drawerHeight = 64.0
    
    @Namespace var namespace
    
    var body: some View {
        ZStack {
            Group {
                GeometryReader { geometry in
                    if fishRendererManager.isFishFocused {
                        FishSceneView(fishRendererManager: fishRendererManager)
                            .matchedGeometryEffect(id: "fish", in: namespace)
                            .onTapGesture {
                                withAnimation {
                                    fishRendererManager.isFishFocused.toggle()
                                }
                            }
                            .background(
                                Image(.gradientStrip)
                                    .resizable()
                            )
                    }
                    ScrollView {
                        ScrollViewReader { proxy in
                            ZStack {
                                Image(.samplePath)
                                    .resizable()
                                    .frame(width: geometry.size.width, height: geometry.size.width * 5712 / 1179)
                                
                                if !fishRendererManager.isFishFocused {
                                    FishSceneView(fishRendererManager: fishRendererManager)
                                        .frame(width: 200, height: 200)
                                        .matchedGeometryEffect(id: "fish", in: namespace)
                                        .position(getPoint(for: viewModel.fishLocation, frameWidth: geometry.size.width))
                                }
                                
                                let unit = geometry.size.width / 1179
                                
                                VStack(spacing: 0) {
                                    Spacer()
                                    ForEach(0..<10) { index in
                                        Text("\(9 - index)")
                                            .frame(height: unit * 150)
                                            .id(9 - index)
                                    }
                                    .opacity(0)
                                }
                                .padding(.bottom, 5712 * unit - (Double(10) * unit * 160))
                                .offset(y: 1000)
                            }
                            .onAppear {
                                withAnimation {
                                    proxy.scrollTo(viewModel.fishLocation, anchor: .center)
                                }
                            }
                            .onChange(of: viewModel.fishLocation) { newValue in
                                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { _ in
                                    withAnimation {
                                        proxy.scrollTo(viewModel.fishLocation, anchor: .center)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.top, 128)
                    .background(
                        Image(.gradientStrip)
                            .resizable()
                    )
                    .opacity(fishRendererManager.isFishFocused ? 0 : 1)
                }
                .clipped()
                .onTapGesture {
                    withAnimation {
                        fishRendererManager.isFishFocused.toggle()
                    }
                }
                .ignoresSafeArea(.container, edges: .top)
                .padding(.bottom, drawerHeight - 16)
            }
            
            VStack {
                VStack {
                    HStack(spacing: 0) {
                        Text(viewModel.brineShrimp <= 100 ? "Location 1" : "Location 2")
                            .font(.headline)
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Image(systemName: "bolt.fill")
                            .foregroundStyle(.secondary)
                            .padding(.trailing, 4)
                        
                        Text("\(viewModel.brineShrimp % 100)/100")
                            .monospacedDigit()
                            .contentTransition(.numericText())
                            .font(.headline)
                            .foregroundStyle(.secondary)
                    }
                    
                    Text(viewModel.brineShrimp <= 100 ? "Coral Reef" : "Deep Sea")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fontWeight(.bold)
                    
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.secondary)
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundStyle(.blue)
                            .frame(width: min(geometry.size.width * (Double(viewModel.brineShrimp % 100) / 100), geometry.size.width))
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
        
        let yOffset = Double(positionIndex) * unit * 160
        
        let xOffsets = [
            0,
            300 * unit,
            2 * 300 * unit,
            300 * unit
        ]
        
        let xOffset = xOffsets[positionIndex % xOffsets.count]
        
        return CGPoint(x: 872 * unit - xOffset,
                       y: 1935 * unit - yOffset + 990)
    }
}

#Preview {
    FishView()
}
