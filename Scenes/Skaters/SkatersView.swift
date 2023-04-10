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
            
            SceneView(scene: {
                let scene = SCNScene(named: "SM_Skate1024.scn")
                scene?.background.contents = UIColor.systemBackground
                return scene
            }(),
                      options: [.allowsCameraControl, .autoenablesDefaultLighting])
            .scaleEffect(0.8)
            .padding(.horizontal,100)
            
        }
    }
    
    struct SwiftUIView_Previews: PreviewProvider {
        static var previews: some View {
            SkatersView()
        }
    }
}
