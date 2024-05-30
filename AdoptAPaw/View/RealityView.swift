import SwiftUI
import RealityKit
import ARKit

struct RealityView: View {
    var pet: Pet
    
    var body: some View {
        return ARViewContainer(modelName: pet.modelName).edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    var modelName: String

    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        arView.addGestureRecognizer(UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap)))
        context.coordinator.view = arView
        arView.session.delegate = context.coordinator
        
        // Load the AR model
        if let modelEntity = try? ModelEntity.load(named: modelName) {
            let anchorEntity = AnchorEntity(plane: .horizontal)
            anchorEntity.addChild(modelEntity)
            arView.scene.addAnchor(anchorEntity)
        }
        
        return arView
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    class Coordinator: NSObject, ARSessionDelegate {
        var view: ARView?
        
        @objc func handleTap() {
            // Handle tap
        }
    }
}
