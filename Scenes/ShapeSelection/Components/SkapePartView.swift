//
//  ShapePartView.swift
//  WWDC_test
//
//  Created by Marina Cristina Marques dos santos on 09/04/23.
//

import SwiftUI

struct SkapePartView: View {
    var skatePart: any SkatePart
    var onSelection: ((Int) -> Void)?
    
    var body: some View {
        skatePart.image
            .padding()
            .scaledToFit()
            .onTapGesture {
                onSelection?(skatePart.didTapImage())
            }
    }
}
