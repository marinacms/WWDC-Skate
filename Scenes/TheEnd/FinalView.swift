//
//  FinalView.swift
//  WWDC-Skate
//
//  Created by Marina Cristina Marques dos santos on 11/04/23.
//

import SwiftUI

struct FinalView: View {
    
    var body: some View {
        ZStack {
                Image("background4")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width)
                    .ignoresSafeArea(.all)
//
        }.onAppear{
            SoundManager.shared.play(name: "click", withExtension: "mp3")
        }
    }
}




