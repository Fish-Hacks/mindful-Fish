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
    
    func makeUIView(context: Context) -> SCNView {
        let view = SCNView()
        view.backgroundColor = .clear
        view.cameraControlConfiguration.allowsTranslation = false
        view.autoenablesDefaultLighting = true
        view.scene = fishRendererManager.scene
        
        let moveUp = SCNAction.moveBy(x: 0, y: 0.2, z: 0, duration: 2) // Moves up by 1 unit in 2 seconds
        let moveDown = SCNAction.moveBy(x: 0, y: -0.2, z: 0, duration: 2) // Moves down by 1 unit in 2 seconds
        
        moveUp.timingMode = .easeInEaseOut
        moveDown.timingMode = .easeInEaseOut
        
        let moveSequence = SCNAction.sequence([moveUp, moveDown])
        let repeatForever = SCNAction.repeatForever(moveSequence)
        
        view.scene!.rootNode.childNodes.first!.runAction(repeatForever)
        
        return view
    }
    
    func updateUIView(_ uiView: SCNView, context: Context) {
        uiView.allowsCameraControl = fishRendererManager.isFishFocused
    }
}
