//
//  ShapeSelectionView.swift
//  WWDC_test
//
//  Created by Marina Cristina Marques dos santos on 07/04/23.
//

import SwiftUI
import SceneKit

struct ShapeSelectionView: View {
    //    SoundManager.shared.play(name: "g2", withExtension: "MP3")
    
    var wheels: [Wheel] = [Wheel(id: 1, image: Image("pinkWheel")),
                           Wheel(id: 2, image: Image("purpleWheel")),
                           Wheel(id: 3, image: Image("whiteWheel"))]
    
    var shapes: [Shape] = [Shape(id: 4, image: Image("blueShape")),
                           Shape(id: 5, image: Image("purpleShape")),
                           Shape(id: 6, image: Image("pinkShape"))]
    
    var trucks: [Truck] = [Truck(id: 7, image: Image("grayTruck")),
                           Truck(id: 8, image: Image("yellowTruck")),
                           Truck(id: 9, image: Image("blackTruck"))]
    @State var count = 0
    @State var countSelection = 0
    
    // O Model Aqui
    @ObservedObject var skateModel = SkateModel()
    
    var body: some View {
        ZStack{
            Image("background3")
                .resizable()
                .frame(width: UIScreen.main.bounds.width)
            
                .ignoresSafeArea(.all)
            VStack(spacing: 0) {
//                Spacer()
                ZStack(alignment: .bottom){
                    SceneView(scene: skateModel.mainScene, options: [.allowsCameraControl, .autoenablesDefaultLighting], antialiasingMode: .multisampling4X)
                        .frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.height*0.60, alignment: .top)
                    Text("Nota: você pode movimentar seu skate e aproximar em cada detalhe que desejar")
                        .padding(.bottom, 25)
                }.padding(.bottom, 10)
                
                ZStack{
                    HStack{
                        if count == 0 {
                            ZStack{
                                Image("backgroundSelection\(count)")
                                    .backgroundImage()
                                SkatePartsList(skateParts: shapes) { id in
                                    updateSkateModel(id: id)
                                }
                                
                            }
//                            .padding(.bottom, 24)
                        } else if count == 1 {
                            ZStack{
                                Image("backgroundSelection\(count)")
                                    .backgroundImage()
                            
                                SkatePartsList(skateParts: trucks) { id in
                                    updateSkateModel(id: id)
                                }
                                
                            }
//                            .padding(.bottom, 24)
                        } else if count == 2 {
                            ZStack{
                                Image("backgroundSelection\(count)")
                                    .backgroundImage()
                                SkatePartsList(skateParts: wheels) { id in
                                    updateSkateModel(id: id)
                                }
                            }
//                            .padding(.bottom, 24)
                        }
                    }
                }
                VStack{
//                    Spacer()
                    HStack{
                        Spacer().frame(width: UIScreen.main.bounds.width*0.75)
                        if countSelection == 2{
                            NavigationLink(destination: SkateFinal(skateScene: skateModel.mainScene)) {
                                Image("buttonNext").resizable()
                                    .scaledToFit()
                                    .frame(width: UIScreen.main.bounds.width*0.129, height: UIScreen.main.bounds.height*0.06)
                            }
                        } else {
                            Button{
                                SoundManager.shared.play(name: "click", withExtension: "mp3")
                                
                                self.countSelection += 1
                                self.count += 1
                                hideOrShowSkateNodes(count: count)
                            } label:{
                                Image("buttonOk").resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: UIScreen.main.bounds.width*0.129, height: UIScreen.main.bounds.height*0.06)
                                    
                            }
                        }
                    }
                }
                
                
            }.ignoresSafeArea()
                .onAppear {
                    hideOrShowSkateNodes(count: count)
                    SoundManager.shared.playBackgroundLoop(name: "energeticHiphop")
                    SoundManager.shared.play(name: "click", withExtension: "mp3")
                }
        }
    }
    
    private func updateSkateModel(id: Int) {
        var node: SCNNode?
        var image: UIImage?
        var color: UIColor?
        
        switch id {
        case 1...3:
            node = skateModel.wheelNode
            if id == 1 {
                color = UIColor(red: 0.7011, green: 0.1590, blue: 0.3050, alpha: 1)
            }
            if id == 2 {
                color = .white
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
                image = UIImage(named: "Truck3")
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
            if node != skateModel.wheelNode {
                skateModel.updateNodeDiffuseImage(node: node, image: image)
            }
        }
    }
    
    private func hideOrShowSkateNodes(count: Int) {
        skateModel.hideOrShowSkateNodes(count: count)
    }
}

open class Navigation: ObservableObject {
    let window: UIWindow
    
    public init(window: UIWindow) {
        self.window = window
    }
}

extension Image{
    func backgroundImage() -> some View{
        self
            .resizable()
            .scaledToFit()
            .frame(width: UIScreen.main.bounds.width*0.64, height: UIScreen.main.bounds.height*0.26)
        
    }
    
    func squareImage() -> some View{
        self
            .resizable()
            .scaledToFit()
            .frame(width: UIScreen.main.bounds.width*0.123, height: UIScreen.main.bounds.height*0.165)
    }
}
