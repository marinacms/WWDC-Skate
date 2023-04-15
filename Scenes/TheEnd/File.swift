//
//  File.swift
//  
//
//  Created by Marina Cristina Marques dos santos on 13/04/23.
//

import SceneKit
import SwiftUI

struct CustomSceneView: UIViewRepresentable {
    
    var scene: SCNScene?
    
    func makeUIView(context: Context) -> some SCNView {
        let view = SCNView()
        view.allowsCameraControl = true
        view.autoenablesDefaultLighting = false
        view.antialiasingMode = .multisampling2X
        view.scene = scene
        view.backgroundColor = .clear
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
