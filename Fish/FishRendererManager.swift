//
//  FishRendererManager.swift
//  Fish
//
//  Created by Jia Chen Yee on 7/10/23.
//

import Foundation
import SceneKit

class FishRendererManager: NSObject, ObservableObject, SCNSceneRendererDelegate {
    
    @Published var isFishFocused = false
    
    var scene: SCNScene?
    
    override init() {
        let scene = SCNScene(named: "Fish.scn")!
        scene.background.contents = UIColor.clear
        
        self.scene = scene
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didRenderScene scene: SCNScene, atTime time: TimeInterval) {
        
    }
}
