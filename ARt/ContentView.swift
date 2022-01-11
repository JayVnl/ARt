import ARKit
import SwiftUI
import RealityKit
import FocusEntity

struct ContentView : View {
	var body: some View {
		return ARViewContainer().edgesIgnoringSafeArea(.all)
	}
}

struct ARViewContainer: UIViewRepresentable {

	func makeUIView(context: Context) -> ARView {
		let view = ARView()

		let session = view.session
		let config = ARWorldTrackingConfiguration()
		config.planeDetection = [.vertical]

		session.run(config)

		context.coordinator.view = view
		session.delegate = context.coordinator

		view.addGestureRecognizer(
			UITapGestureRecognizer(
				target: context.coordinator,
				action: #selector(Coordinator.handleTap)
			)
		)

		return view
	}

	func updateUIView(_ uiView: ARView, context: Context) {}

	func makeCoordinator() -> Coordinator {
		Coordinator()
	}

	class Coordinator: NSObject, ARSessionDelegate {
		weak var view: ARView?
		var focusEntity: FocusEntity?

		func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
			guard let view = self.view else { return }
			debugPrint("Anchors added to the scene: ", anchors)
			self.focusEntity = FocusEntity(on: view, style: .classic(color: .white))
		}

		@objc func handleTap() {
			guard let view = self.view, let focusEntity = self.focusEntity else { return }

			let anchor = AnchorEntity()
			view.scene.anchors.append(anchor)

			let plane = MeshResource.generatePlane(width: 0.3, height: 0.5)
			var material = SimpleMaterial()
			material.color = try! .init(tint: .white, texture: .init(.load(named: "children_yellow.jpeg", in: nil)))
			let artEntity = ModelEntity(mesh: plane, materials: [material])
			artEntity.position = focusEntity.position

			anchor.addChild(artEntity)
		}
	}

}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
#endif
