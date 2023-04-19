//
//  FinalView.swift
//  WWDC-Skate
//
//  Created by Marina Cristina Marques dos santos on 11/04/23.
//

import SwiftUI

struct FinalView: View {
    
//    @State var count = 0
    var body: some View {
        ZStack {
//            if count == 0{
                Image("background4")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width)
                    .ignoresSafeArea(.all)
//            } else if count == 1{
//                Image("Mock1").resizable()
//            } else if count == 2 {
//                Image("Mock").resizable().scaledToFit()
//            }
            
//            VStack {
//                Spacer()
//                HStack(spacing: 100) {
//                    Button {
//                       count = 1
//                    } label: {
//                        Text("About").font(.largeTitle).background(Color.mint)
//                    }
//
//                    Button {
//                        count = 2
//                    } label: {
//                        Text("Credits").font(.largeTitle).background(Color.mint)
//                    }
//
//                }.padding(.bottom, 100)
//            }
        }.onAppear{
            SoundManager.shared.play(name: "click", withExtension: "mp3")
        }
    }
}




