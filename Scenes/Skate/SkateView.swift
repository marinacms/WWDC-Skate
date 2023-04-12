import SwiftUI
import SceneKit

struct SkateView: View {
    @ObservedObject var skateModel: SkateModel
    
    var body: some View {
        SceneView(scene: skateModel.getScene(),
                  options: [.autoenablesDefaultLighting, .allowsCameraControl])
//        .padding()
    }
}
