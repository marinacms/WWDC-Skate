//
//  Apresentation.swift
//  WWDC-Skate
//
//  Created by Marina Cristina Marques dos santos on 13/04/23.
//

import SwiftUI

struct Apresentation: View {
    
    let images = ["Mock", "Mock"]
    
    @State var count = 0
    @ObservedObject var skateModel = SkateModel()
    
    var body: some View {
        ZStack{
            HStack{
                getImage(num: count)
                
                
                if count != images.count - 1 {
                    Button(action: { count += 1 }) {
                        Text("Ok")
                    }
                } else {
                    NavigationLink(destination: {
                        SkatersView()
                            .navigationBarBackButtonHidden(true)
                    }, label: {
                        Text("next")
                    })
                    
                }
            }
        }
    }
    
    func getImage(num: Int) -> Image {

        let image = Image(images[num])
        return image
    }
}

struct Apresentation_Previews: PreviewProvider {
    static var previews: some View {
        Apresentation()
    }
}

