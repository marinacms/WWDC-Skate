import SwiftUI
import SceneKit

struct SkateView: View {
    @ObservedObject var skateModel: SkateModel
    
    var body: some View {
        CustomSceneView(scene: skateModel.getScene())
//        SceneView(scene: skateModel.getScene(),
//                  options: [.autoenablesDefaultLighting, .allowsCameraControl])
    }
}
