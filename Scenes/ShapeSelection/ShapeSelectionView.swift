//
//  ShapeSelectionView.swift
//  WWDC_test
//
//  Created by Marina Cristina Marques dos santos on 07/04/23.
//

import SwiftUI
import SceneKit

struct ShapeSelectionView: View {
    
    var wheels: [Wheel] = [Wheel(id: 1, image: Image("Mock")),
                           Wheel(id: 2, image: Image("Mock")),
                           Wheel(id: 3, image: Image("Mock"))]
    
    var shapes: [Shape] = [Shape(id: 4, image: Image("Mock")),
                           Shape(id: 5, image: Image("Mock")),
                           Shape(id: 6, image: Image("Mock"))]
    
    var trucks: [Truck] = [Truck(id: 7, image: Image("Mock")),
                           Truck(id: 8, image: Image("Mock")),
                           Truck(id: 9, image: Image("Mock"))]
    var count = 0

    // O Model Aqui
    @ObservedObject var skateModel = SkateModel()
    
    var body: some View {
        VStack{
            Spacer()
            SkateView(skateModel: skateModel)
                .frame(width: 600, height: 600, alignment: .top)
                .padding(.top,80)
            if count == 0 {
                SkatePartsList(skateParts: wheels) { id in
                    Task {
                        await updateSkateModel(id: id)
                    }
                }.padding()
            } else if count == 1 {
                SkatePartsList(skateParts: shapes) { id in
                    Task {
                        await updateSkateModel(id: id)
                    }
                }.padding()
            } else if count == 2 {
                SkatePartsList(skateParts: trucks) { id in
                    Task {
                        await updateSkateModel(id: id)
                    }
                }.padding()
            }
            Spacer()
        }
    }
    
    private func updateSkateModel(id: Int) async {
        var node: SCNNode?
        var image: UIImage?
        var color: UIColor?
        
        switch id {
        case 1...3:
            node = skateModel.wheelNode
            if id == 1 {
                color = .red
            }
            if id == 2 {
                color = .green
            }
            if id == 3 {
                color = .blue
            }
        case 4...6:
            node = skateModel.shapeNode
            if id == 4 {
                image = UIImage(named: "Mock")
            }
            if id == 5 {
                image = UIImage(named: "Mock")
            }
            if id == 6 {
                image = UIImage(named: "Mock")
            }
        case 7...9:
            node = skateModel.truckNode
            if id == 7 {
                image = UIImage(named: "Mock")
            }
            if id == 8 {
                image = UIImage(named: "Mock")
            }
            if id == 9 {
                image = UIImage(named: "Mock")
            }
        default:
            break
        }
        
        if let node, let color {
            if node == skateModel.wheelNode{
                await skateModel.updateNodeDiffuseColor(node: node, color: color)
            }
        }
        
        if let image, let node {
            if node != skateModel.wheelNode{
                await skateModel.updateNodeDiffuseImage(node: node, image: image)
            }
        }
    }
}
