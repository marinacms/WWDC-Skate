//
//  Shape.swift
//  WWDC_test
//
//  Created by Marina Cristina Marques dos santos on 07/04/23.
//

import Foundation
import SwiftUI

struct Shape: Identifiable, SkatePart {
    var id: Int
    var image: Image

    func didTapImage() -> Int {
        print("Did Tap Shape \(id)")
        return id
    }
}
