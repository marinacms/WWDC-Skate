//
//  FinalView.swift
//  WWDC-Skate
//
//  Created by Marina Cristina Marques dos santos on 11/04/23.
//

import SwiftUI

struct FinalView: View {
    
    var body: some View {
        VStack{
            Spacer()
            HStack(spacing: 100) {
                Button {
                    
                } label: {
                    Text("About").font(.largeTitle)
                }
                
                Button {
                    
                } label: {
                    Text("Credits").font(.largeTitle)
                }
                
            }.padding(.bottom, 100)
        }
        
        if Button
    }
}

struct FinalView_Previews: PreviewProvider {
    static var previews: some View {
        FinalView()
    }
}


