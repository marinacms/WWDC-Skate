//
//  SwiftUIView.swift
//  
//
//  Created by Marina Cristina Marques dos santos on 11/04/23.
//

import SwiftUI

struct SkatePartsList<T: SkatePart>: View {
    var skateParts: [T]
    var onSelection: ((Int) -> Void)?
    
    var body: some View {
        ZStack{
//            Color.mint
            HStack(){
    //            ScrollView(.horizontal, showsIndicators: false) {
                    ForEach(skateParts){ skatePart in
                        SkatePartView(skatePart: skatePart) { id in
                            onSelection?(skatePart.id)
                        }
                    }
    //            }
//                .background(Color.mint)
            }
        }
        
    }
}
