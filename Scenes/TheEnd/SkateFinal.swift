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
    let images = ["ballonSix", "ballonSeven"]
    
    var body: some View {
        ZStack{
            Image("background3")
                .resizable()
                .frame(width: UIScreen.main.bounds.width)
                .ignoresSafeArea(.all)
            
            ZStack{
                CustomSceneView(scene: skateScene)
                getImage(num: count)
                    .resizable()
                // .frame(maxWidth: .infinity, maxHeight: . infinity)
                    .frame(width: UIScreen.main.bounds.width * 0.80, height: UIScreen.main.bounds.height * 0.30)
                    .padding(.top, 650)
                HStack{
                    if count != images.count - 1 {
                        Button(action: {
                            count += 1
                        }) {
                            Image("buttonOk")
                                .resizable()
                        }
                    } else {
                        NavigationLink(destination: {
                            FinalView()
                                .navigationBarBackButtonHidden(true)
                        }, label: {
                            Image("buttonNext")
                                .resizable()
                        })
                    }
                    
                    
                }
                .frame(width: UIScreen.main.bounds.width * 0.10, height: UIScreen.main.bounds.height * 0.06)
                .alignmentGuide(.bottom){dimension in
                        dimension.height / 2
                    }
                .offset(x: 440, y: 420)
                
            }
            .onAppear{
                SoundManager.shared.play(name: "click", withExtension: "mp3")
            }.onDisappear{
                SoundManager.shared.stopPlayBackgroundLoop()
            }
        }.navigationBarBackButtonHidden(true)
    }
    
    private func getImage(num: Int) -> Image {
        let image = Image(images[num])
        return image
    }
}
