//
//  SkateFinal.swift
//  WWDC-Skate
//
//  Created by Marina Cristina Marques dos santos on 13/04/23.
//

import SwiftUI
import SceneKit

struct SkateFinal: View {
    
    @State var count = 0
    var skateScene: SCNScene
    let images = ["Button", "Button"]
    
    var body: some View {
        VStack{
            CustomSceneView(scene: skateScene)
            getImage(num: count)
            
            if count != images.count - 1 {
                Button(action: {
                    count += 1
                }) {
                    Text("Ok")
                }
            } else {
                NavigationLink(destination: {
                    FinalView()
                        .navigationBarBackButtonHidden(true)
                }, label: {
                    Text("next")
                })
            }
        }
        .onAppear{
            SoundManager.shared.play(name: "click", withExtension: "mp3")
        }.onDisappear{
            SoundManager.shared.stopPlayBackgroundLoop()
        }
    }
    
    private func getImage(num: Int) -> Image {
        let image = Image(images[num])
        return image
    }
}
