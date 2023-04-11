//
//  File.swift
//  
//
//  Created by Marina Cristina Marques dos santos on 11/04/23.
//

import Foundation
import SwiftUI

struct Wheel: Identifiable, SkatePart {
    var id: Int
    var image: Image
    
    func didTapImage() -> Int {
        return id
    }
}
