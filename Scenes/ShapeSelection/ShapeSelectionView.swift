//
//  ShapeSelectionView.swift
//  WWDC_test
//
//  Created by Marina Cristina Marques dos santos on 07/04/23.
//

import SwiftUI

struct ShapeSelectionView: View {
    var shapes: [Shape] = [Shape(id: 1, image: Image("Mock")),
                           Shape(id: 2, image: Image("Mock")),
                           Shape(id: 3, image: Image("Mock"))]
    
    // O Model Aqui
    @ObservedObject var skateModel = SkateModel()
    
    var body: some View {
        VStack{
            Spacer()
            SkateView(skateModel: skateModel)
                .frame(width: 450, height: 450, alignment: .top)
                .padding(.top,80)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(shapes){ shape in
                        ShapePartView(shape: shape)
                            .onTapGesture {
                            Task {
                                await updateSkateModel(id: shape.id)
                            }
                        }
                    }
                }
                .padding()
            }.padding()
            Spacer()
        }
    }
    
    private func updateSkateModel(id: Int) async {
        var color: UIColor = UIColor()
        switch id {
        case 1:
            color = .red
        case 2:
            color = .green
        case 3:
            color = .blue
        default:
            color = .red
        }
        await skateModel.updateNodeDiffuseColor(node: skateModel.wheelNode, color: color)
//        await SkateModel.updateNodeDiffuseColor(<#T##self: SkateModel##SkateModel#>)
    }
    
}
