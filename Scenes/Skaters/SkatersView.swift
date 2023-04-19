//
//  SwiftUIView.swift
//  WWDC_test
//
//  Created by Marina Cristina Marques dos santos on 08/04/23.
//

import SwiftUI
import SceneKit

struct SkatersView: View {
    let background = ["Lizzie","Karen","Rayssa"]
    @State var count = 0 
    var body: some View {
        ZStack{
            getImage(num: count)
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
                
             //   GirlsSkate()
                
            }
            HStack{
                if count != background.count - 1 {
                    Button(action: { count += 1 }) {
                        Image("buttonOk")
                            .resizable()
                            
                    }
                }else {
                    NavigationLink(destination: {
                        IntroTwoView()
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
    }
    
    
    func getImage(num: Int) -> Image {
        
        let image = Image(background[num])
        return image
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
