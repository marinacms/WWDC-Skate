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
   @State var count = 0
    
    @State var countSelection = 0
    
    // O Model Aqui
    @ObservedObject var skateModel = SkateModel()
    
    var body: some View {
        //        NavigationView{
        VStack{
            //                Spacer()
            SkateView(skateModel: skateModel)
                .frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.height*0.60, alignment: .top)
            //                    .padding(.top, 80)
                .background(Color.pink)
            //                Spacer()
            ZStack{
                //                    Spacer()
                //                    Text("oi")
                HStack{
                    if count == 0 {
                        SkatePartsList(skateParts: shapes) { id in
                            updateSkateModel(id: id)
                        }
                        //                        .padding()
                    } else if count == 1 {
                        SkatePartsList(skateParts: trucks) { id in
                            updateSkateModel(id: id)
                        }
                        //                        .padding()
                    } else if count == 2 {
                        SkatePartsList(skateParts: wheels) { id in
                            updateSkateModel(id: id)
                        }
                    }
                }
                HStack{
                    if countSelection == 2{
                        NavigationLink {
                            FinalView()
                                .navigationBarBackButtonHidden(true)
                        } label: {
                            Text("NEXT").padding(40)
                                .padding(.trailing, 16)
                        }
                        
                    } else {
                        Button{
                            self.countSelection += 1
                            self.count += 1
                        } label:{
                            Text("OK").padding(40)
                                .padding(.trailing, 16)
                            
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }.ignoresSafeArea()
        
    }
    
    private func updateSkateModel(id: Int) {
        var node: SCNNode?
        var image: UIImage?
        var color: UIColor? = .red
        
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
                image = UIImage(named: "Shape1")
            }
            if id == 5 {
                image = UIImage(named: "Shape2")
            }
            if id == 6 {
                image = UIImage(named: "Shape3")
            }
        case 7...9:
            node = skateModel.truckNode
            if id == 7 {
                image = UIImage(named: "Truck1")
            }
            if id == 8 {
                image = UIImage(named: "Truck2")
            }
            if id == 9 {
                image = UIImage(named: "Mock")
            }
        default:
            break
        }
        
        if let node, let color {
            if node == skateModel.wheelNode{
                skateModel.updateNodeDiffuseColor(node: node, color: color)
            }
        }
        
        if let image, let node {
            if node != skateModel.wheelNode{
                skateModel.updateNodeDiffuseImage(node: node, image: image)
            }
        }
        
    
        }
    }

