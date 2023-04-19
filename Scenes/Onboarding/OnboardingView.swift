//
//  Onboarding.swift
//  WWDC-Skate
//
//  Created by Marina Cristina Marques dos santos on 11/04/23.
//

import SwiftUI

struct Onboarding: View {
    var body: some View {
        ZStack{
            Image("backgroundOnboarding")
                .resizable()
                .frame(width: UIScreen.main.bounds.width)
                .ignoresSafeArea(.all)
            
            VStack{
                Spacer()
                NavigationLink {
                    IntroView() .navigationBarBackButtonHidden(true)
                } label: {
                    Image("buttonStart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width*0.25, height: UIScreen.main.bounds.height*0.26)
                                    }.onAppear{
                                        SoundManager.shared.playBackgroundLoop(name: "energeticHiphop")
                                    }.onDisappear{
                                            SoundManager.shared.stopPlayBackgroundLoop()
                                    }
                }.padding(.bottom, 65)
            }
        }
        
    }


    
    
    
    
