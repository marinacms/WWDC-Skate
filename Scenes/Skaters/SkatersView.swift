//
//  SwiftUIView.swift
//  WWDC_test
//
//  Created by Marina Cristina Marques dos santos on 08/04/23.
//

import SwiftUI
import SceneKit

struct SkatersView: View {
    
    var body: some View {
        HStack{
            VStack{
                Image("MockImage2")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(0.8)
                    .padding(.bottom,16)
                
                Text("Hello, World!")
                Spacer()
            }
            
            GirlsSkate()
            
        }
        
        NavigationLink(destination: {
            Apresentation2()
                .navigationBarBackButtonHidden(true)
        }, label: {
            Text("next")
        })
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SkatersView()
    }
}

struct GirlsSkate: UIViewRepresentable {
    func makeUIView(context: Context) -> SCNView {
        let sceneView = SCNView(frame: .zero)
        sceneView.antialiasingMode = .none
        let scene = SCNScene(named: "SM_Skate1024.scn")!
        sceneView.scene = scene
        sceneView.allowsCameraControl = true
        return sceneView
        
    }
    

    func updateUIView(_ uiView: SCNView, context: Context) {}
}
