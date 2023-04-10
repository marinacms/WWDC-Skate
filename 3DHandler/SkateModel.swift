//
//  File.swift
//  
//
//  Created by Marina Cristina Marques dos santos on 09/04/23.
//

import SceneKit

class SkateModel: ObservableObject {
    @Published var skateScene: SCNScene
    @Published var skateNode: SCNNode
    @Published var wheelNode: SCNNode
    @Published var truckNode: SCNNode
    @Published var screwNode: SCNNode
    @Published var shapeNode: SCNNode
    
    init() {
        // guard let para tentar acessar os dados reais e exibir erro caso não consiga
        do {
            guard let url = Bundle.main.url(forResource: "SM_Skate1024", withExtension: "scn", subdirectory: "3DAssets") else {
                fatalError("Could not find 3D file.")
            }
            let skateScene = try SCNScene(url: url, options: nil)
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
            
        } catch {
            fatalError("Failed to load 3D file: \(error.localizedDescription)")
        }
    }
    
    // Metodo que retorna uma SCNScene com uma camera e o skateNode
    func getScene() -> SCNScene {
        let scene = SCNScene()
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0.0, y: 0.0, z: 100.0)
        scene.rootNode.addChildNode(cameraNode)
        cameraNode.camera?.zFar = 150
        
        scene.rootNode.addChildNode(skateNode)
        return scene
    }
    
    // Atualiza a cor do diffuse do node passado
    func updateNodeDiffuseColor(node: SCNNode, color: UIColor) async {
        guard let material = await node.geometry?.materials.first else { return }
        
        material.diffuse.contents = color
        
        await node.geometry?.firstMaterial = material
    }
    
    // Atualiza a imagem do diffuse do node passado
    func updateNodeDiffuseImage(node: SCNNode, image: UIImage) async {
        guard let material = await node.geometry?.materials.first else { return }
        
        material.diffuse.contents = image
        
        await node.geometry?.firstMaterial = material
    }
        
}
