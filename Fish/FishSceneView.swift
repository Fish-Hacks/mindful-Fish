//
//  FishSceneView.swift
//  Fish
//
//  Created by Jia Chen Yee on 7/10/23.
//

import Foundation
import SwiftUI
import SceneKit

struct FishSceneView: UIViewRepresentable {
    @ObservedObject var fishRendererManager: FishRendererManager
    
    func makeUIView(context: Context) -> some UIView {
        let view = SCNView()
        view.backgroundColor = .clear
//        view.allowsCameraControl = true
        view.cameraControlConfiguration.allowsTranslation = false
        view.autoenablesDefaultLighting = true
        view.scene = fishRendererManager.scene
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}
