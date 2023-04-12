//
//  FinalView.swift
//  WWDC-Skate
//
//  Created by Marina Cristina Marques dos santos on 11/04/23.
//

import SwiftUI

struct FinalView: View {
    var body: some View {
        Button {
            print("button pressed ")
        } label: {
            Image("Mock")
        }

    }
}

struct FinalView_Previews: PreviewProvider {
    static var previews: some View {
        FinalView()
    }
}

//Button ("Botão"){
//    print("o botao foi pressionado")
//    Image("Button")
//}
