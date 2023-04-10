//
//  ShapePartView.swift
//  WWDC_test
//
//  Created by Marina Cristina Marques dos santos on 09/04/23.
//

import SwiftUI

struct ShapePartView: View {
    @State var shape: Shape
    
    var body: some View {
        shape.image
            .padding()
            .scaledToFit()
            .onTapGesture {
                print(shape.id)
            }
    }
}


