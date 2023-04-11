//
//  Skate.swift
//  WWDC_test
//
//  Created by Marina Cristina Marques dos santos on 07/04/23.
//

import SwiftUI

protocol SkatePart: Identifiable {
    var id: Int { get }
    var image: Image { get }
    
    func didTapImage() -> Int
}

struct Skate {
    var shape: Shape
    var wheel: Wheel
    var truck: Truck
}
