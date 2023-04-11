//
//  File.swift
//  
//
//  Created by Marina Cristina Marques dos santos on 11/04/23.
//

import Foundation
import SwiftUI

struct Truck: Identifiable, SkatePart {
    var id: Int
    var image: Image
    
    func didTapImage() -> Int {
        print("Did tap Truck \(id)")
        return id
    }
}
