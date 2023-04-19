//
//  SwiftUIView.swift
//  
//
//  Created by Marina Cristina Marques dos santos on 14/04/23.
//

import SwiftUI

struct IntroTwoView: View {
    
    let images = ["ballonFour", "ballonFive"]
    
    @State var count = 0
    @ObservedObject var skateModel = SkateModel()
    @State private var isShowingText = true
    
    
    var body: some View {
        ZStack{
            Image("background2")
                .resizable()
                .frame(width: UIScreen.main.bounds.width)
                .ignoresSafeArea(.all)
            
            ZStack{
                getImage(num: count)
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width * 0.80, height: UIScreen.main.bounds.height * 0.30)
                    .padding(.top, 650)
                
                HStack{
                    
                    if count != images.count - 1 {
                        Button(action: { count += 1 }) {
                            Image("buttonOk")
                        }
                    } else {
                        
                        NavigationLink(destination: {
                            ShapeSelectionView()
                                .navigationBarBackButtonHidden(true)
                        }, label: {
                            Image("buttonYes")
                        })
                        
                    }
                }.frame(width: UIScreen.main.bounds.width * 0.10, height: UIScreen.main.bounds.height * 0.06)
            }
        }.onAppear{
            SoundManager.shared.play(name: "click", withExtension: "mp3")
        }
    }
    
    func getImage(num: Int) -> Image {
        
        let image = Image(images[num])
        return image
    }
}
