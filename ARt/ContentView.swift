import ARKit
import SwiftUI
import RealityKit
import FocusEntity

struct ContentView : View {
	// MARK: PROPERTIES
	
	// MARK: BODY
	var body: some View {
		HomeView()
	}
}

// MARK: PREVIEW
struct ContentView_Previews : PreviewProvider {
	static var previews: some View {
		ContentView()
			.previewDevice("iPhone 13")
	}
}
