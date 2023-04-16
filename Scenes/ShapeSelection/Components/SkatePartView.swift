//
//  ShapePartView.swift
//  WWDC_test
//
//  Created by Marina Cristina Marques dos santos on 09/04/23.
//

import SwiftUI

struct SkatePartView: View {
    @State var skatePart: any SkatePart
    var onSelection: ((Int) -> Void)?
    
    var body: some View {
        skatePart.image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(.horizontal, 12)
            .padding(.vertical, 24)
            .onTapGesture {
                onSelection?(skatePart.didTapImage())
            }
    }
}
