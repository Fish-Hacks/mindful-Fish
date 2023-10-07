//
//  FishView.swift
//  Fish
//
//  Created by Jia Chen Yee on 7/10/23.
//

import SwiftUI
import SceneKit

struct FishView: View {
    
    @StateObject var viewModel = ViewModel()
    @StateObject var fishRendererManager = FishRendererManager()
    
    @State private var drawerHeight = 64.0
    
    @Namespace var namespace
    
    var body: some View {
        ZStack {
            if fishRendererManager.isFishFocused {
                FishSceneView(fishRendererManager: fishRendererManager)
                    .matchedGeometryEffect(id: "fish", in: namespace)
                    .onTapGesture {
                        withAnimation {
                            fishRendererManager.isFishFocused.toggle()
                        }
                    }
            } else {
                GeometryReader { geometry in
                    ScrollView {
                        ScrollViewReader { proxy in
                            ZStack {
                                Image(.samplePath)
                                    .resizable()
                                    .frame(width: geometry.size.width, height: geometry.size.width * 2556 / 1179)
                                
                                FishSceneView(fishRendererManager: fishRendererManager)
                                    .matchedGeometryEffect(id: "fish", in: namespace)
                                    .frame(width: 200, height: 200)
                                    .position(getPoint(for: viewModel.fishLocation, frameWidth: geometry.size.width))
                                
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
                                .padding(.bottom, 1935 * unit - (Double(10) * unit * 150))
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
                        Text("Location 1")
                            .font(.headline)
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Image(systemName: "bolt.fill")
                            .foregroundStyle(.secondary)
                            .padding(.trailing, 4)
                        
                        Text("\(viewModel.brineShrimp)/100")
                            .monospacedDigit()
                            .contentTransition(.numericText())
                            .font(.headline)
                            .foregroundStyle(.secondary)
                    }
                    
                    Text("Coral Reef")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fontWeight(.bold)
                    
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.secondary)
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundStyle(.blue)
                            .frame(width: min(geometry.size.width * (Double(viewModel.brineShrimp) / 100), geometry.size.width))
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
        .environmentObject(viewModel)
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
