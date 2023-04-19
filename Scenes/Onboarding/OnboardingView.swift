//
//  Onboarding.swift
//  WWDC-Skate
//
//  Created by Marina Cristina Marques dos santos on 11/04/23.
//

import SwiftUI

struct Onboarding: View {
    var body: some View {
            NavigationLink {
                IntroView() .navigationBarBackButtonHidden(true)
            } label: {
                Image("Mock")
                    .scaleEffect(0.4)
                    .aspectRatio(contentMode: .fit)
            }.onAppear{
                SoundManager.shared.playBackgroundLoop(name: "energeticHiphop")
            }
    }
        
}


struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
