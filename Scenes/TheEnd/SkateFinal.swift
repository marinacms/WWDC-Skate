//
//  SkateFinal.swift
//  WWDC-Skate
//
//  Created by Marina Cristina Marques dos santos on 13/04/23.
//

import SwiftUI
import SceneKit

struct SkateFinal: View {
    
    @ObservedObject var skateModel: SkateModel
    
    var body: some View {
        CustomSceneView(scene: skateModel.getScene())
//        SceneView(scene: skateModel.getScene(),
//                  options: [.autoenablesDefaultLighting, .allowsCameraControl])
    }
}
