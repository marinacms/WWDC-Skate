//
//  SwiftUIView.swift
//  
//
//  Created by Marina Cristina Marques dos santos on 14/04/23.
//

import SwiftUI

struct Apresentation2: View {
    
    let images = ["Mock", "Mock"]
    
    @State var count = 0
    @ObservedObject var skateModel = SkateModel()
    
    var body: some View {
        ZStack{
            HStack{
//
                
                if count != images.count - 1 {
                    Button(action: { count += 1 }) {
                        Text("Ok")
                    }
                } else {
                    NavigationLink(destination: {
                      ShapeSelectionView()
                            .navigationBarBackButtonHidden(true)
                    }, label: {
                        Text("next")
                    })
                    
                }
            }
        }
    }
}
