import ARKit
import SwiftUI
import RealityKit
import FocusEntity

struct ContentView : View {
	var body: some View {
		HomeView()
	}
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
	static var previews: some View {
		ContentView()
			.previewDevice("iPhone 13")
	}
}
#endif
