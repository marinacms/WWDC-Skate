//
//  FinalView.swift
//  WWDC-Skate
//
//  Created by Marina Cristina Marques dos santos on 11/04/23.
//

import SwiftUI

struct FinalView: View {
    
    @State var opacity = 0.0
    
    var body: some View {
        ZStack{
            VStack {
                Text("oi")
            }
//            Button {
//                print("button pressed ")
//            } label: {
//                Image("Mock")
//            }
        }
        .opacity(opacity)
        .onAppear{
            withAnimation(.easeIn(duration: 3.0)) {
                opacity = 1.0
            }
        }
    }
}

struct FinalView_Previews: PreviewProvider {
    static var previews: some View {
        FinalView()
    }
}


