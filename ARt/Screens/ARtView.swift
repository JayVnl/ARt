import ARKit
import SwiftUI
import RealityKit
import FocusEntity
import SwiftUIRouter

struct ARtView: View {
	// MARK: PROPERTIES
	@EnvironmentObject private var navigator: Navigator
	@EnvironmentObject var model: ArtworksModel
	
	// MARK: BODY
	var body: some View {
		ZStack {
			ARViewContainer(imageURL: model.selectedArtworkImage!).edgesIgnoringSafeArea(.all)
			
			VStack {
				HStack {
					Button(action: { navigator.goBack() }, label: {
						Image(systemName: "chevron.left")
							.font(.title2)
							.foregroundColor(.black)
							.rotationEffect(.degrees(-45))
					}) //: BUTTON
						.frame(
							width: 24,
							height: 24
						)
						.padding(.all, 8)
						.background(.white)
						.rotationEffect(.degrees(45))
				} //: HSTACK
				.frame(
					minWidth: 0,
					maxWidth: .infinity,
					alignment: .topLeading
				)
				.padding(.horizontal, 30)
			} //: VSTACK
			.frame(
				minWidth: 0,
				maxWidth: .infinity,
				minHeight: 0,
				maxHeight: .infinity,
				alignment: .topLeading
			)
			.padding(.vertical, 20)
		}
	}
}

struct ARViewContainer: UIViewRepresentable {
	var imageURL: String
	
#if !targetEnvironment(simulator)
	func makeUIView(context: Context) -> ARView {
		let view = ARView()
		
		let session = view.session
		let config = ARWorldTrackingConfiguration()
		config.planeDetection = [.vertical]
		
		session.run(config)
		
		context.coordinator.view = view
		context.coordinator.imageURL = imageURL
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
		var imageURL: String = ""
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
//			material.color = try! .init(tint: .white, texture: .init(.load(named: "children_yellow.jpeg", in: nil)))
			guard let url = URL(string: imageURL) else {
				print("Invalid URL")
				return
			}
			do {
				material.color = .init(tint: .white, texture: .init(try .load(contentsOf: url)))
			} catch {
				material.color = try! .init(tint: .white, texture: .init(.load(named: "children_yellow.jpeg", in: nil)))
			}
			let artEntity = ModelEntity(mesh: plane, materials: [material])
			artEntity.position = focusEntity.position
			
			anchor.addChild(artEntity)
		}
	}
#else
	// on the simulator execute a fake conformance to UIViewRepresentable...
	func makeUIView(context: Context) -> UIView { UIView() }
	func updateUIView(_ uiView: UIView, context: Context) {}
#endif
}

#if DEBUG
struct ARtView_Previews: PreviewProvider {
	static var previews: some View {
		ARtView()
	}
}
#endif
