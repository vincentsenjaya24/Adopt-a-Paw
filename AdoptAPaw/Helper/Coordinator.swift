import Foundation
import ARKit
import RealityKit
import Combine

class Coordinator: NSObject, ARSessionDelegate {
    
    weak var view: ARView?
    var cancellable: AnyCancellable?
   
    @objc func handleTap(_ recognizer: UITapGestureRecognizer) {
        
        guard let view = self.view else { return }
        
        guard view.scene.anchors.first(where: { $0.name == "GroundAnchor" }) == nil else {
            return
        }
        
        let tapLocation = recognizer.location(in: view)
        
        let results = view.raycast(from: tapLocation, allowing: .estimatedPlane, alignment: .horizontal)
        
        if let result = results.first {
            
            // create anchor entity
            let anchor = AnchorEntity(raycastResult: result)
            
            //TODO: Ini kayaknya kalau ga kepake bisa dihapus
//            cancellable = ModelEntity.loadAsync(named: "shiba3")
//                .sink { loadCompletion in
//                    if case let .failure(error) = loadCompletion {
//                        print("Unable to load model \(error)")
//                    }
//
//                    self.cancellable?.cancel()
//
//                } receiveValue: { entity in
//                    anchor.name = "LunarRoverAnchor"
//                    anchor.addChild(entity)
//                }
            
            view.scene.addAnchor(anchor)
        }
    }
}
