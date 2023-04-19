//
//  File.swift
//  
//
//  Created by Marina Cristina Marques dos santos on 09/04/23.
//

import SceneKit
import UIKit

class SkateModel: ObservableObject {
    
    var mainScene: SCNScene
    
    @Published var skateScene: SCNScene
    @Published var skateNode: SCNNode
    @Published var wheelNode: SCNNode
    @Published var truckNode: SCNNode
    @Published var screwNode: SCNNode
    @Published var shapeNode: SCNNode
    
    init() {
        let cameraNode = SCNNode()
        
        // guard let para tentar acessar os dados reais e exibir erro caso não consiga
        do {
            guard let skateScene = SCNScene(named: "SM_Skate1024.scn") else {
                fatalError("Could not find 3D file.")
            }
            guard let skateNode = skateScene.rootNode.childNodes.first,
                let wheelNode = skateNode.childNode(withName: "wheel", recursively: true),
                let truckNode = skateNode.childNode(withName: "truck", recursively: true),
                let screwNode = skateNode.childNode(withName: "screw", recursively: true),
                let shapeNode = skateNode.childNode(withName: "shape", recursively: true) else {
                    fatalError("Could not find nodes in 3D file.")
            }
            
            self.skateScene = skateScene
            self.skateNode = skateNode
            self.wheelNode = wheelNode
            self.truckNode = truckNode
            self.screwNode = screwNode
            self.shapeNode = shapeNode
            self.mainScene = skateScene
            initialMaterialSetup()
            
        }
        
        //MARK: - Setup da Câmera
        
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 0.0, z: 100.0)
        mainScene.rootNode.addChildNode(cameraNode)
        cameraNode.camera?.zFar = 165
        
        skateNode.scale = SCNVector3(3.8, 3.8, 3.8)
        mainScene.rootNode.addChildNode(skateNode)
    }
    
    func initialMaterialSetup(){
        let truckMaterial = truckNode.geometry?.materials.first
        truckMaterial?.diffuse.contents = UIImage(named: "Truck1")
    }
    
    // Metodo que retorna uma SCNScene com uma camera e o skateNode
    func getScene() -> SCNScene {
        let scene = SCNScene()
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 0.0, z: 100.0)
        scene.rootNode.addChildNode(cameraNode)
        cameraNode.camera?.zFar = 165
        
        skateNode.scale = SCNVector3(3.8, 3.8, 3.8)
        scene.rootNode.addChildNode(skateNode)
        return scene
    }
    
    // Atualiza a cor do diffuse do node
    func updateNodeDiffuseColor(node: SCNNode, color: UIColor) {
        guard let material = node.geometry?.materials.first else { return }
        
        material.diffuse.contents = color
        
        node.geometry?.firstMaterial = material
    }
    
    // Atualiza a imagem do diffuse do node
    func updateNodeDiffuseImage(node: SCNNode, image: UIImage) {
        guard let material = node.geometry?.materials.first else { return }
        
        material.diffuse.contents = image
        
        node.geometry?.firstMaterial = material
    }
    
    // Atualiza o material do node
    func updateNodeMaterial(node: SCNNode, newMaterial: SCNMaterial) {
        guard var material = node.geometry?.materials.first else { return }
        
        material = newMaterial
        node.geometry?.firstMaterial = material
    }
    
    func hideOrShowSkateNodes(count: Int){
        switch count {
        case 0:
            wheelNode.isHidden = true
            screwNode.isHidden = true
            truckNode.isHidden = true
        case 1:
            truckNode.isHidden = false
        case 2:
            wheelNode.isHidden = false
            screwNode.isHidden = false
        default:
            wheelNode.isHidden = false
            screwNode.isHidden = false
            truckNode.isHidden = false
            shapeNode.isHidden = false
            break
        }
    }
        
}
