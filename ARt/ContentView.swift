import SwiftUI
import SwiftUIRouter

struct ContentView : View {
	// MARK: PROPERTIES
	@ObservedObject var model = ArtworksModel()
	
	// MARK: BODY
	var body: some View {
		Router {
			RoutingView()
		}
		.environmentObject(model)
	}
}

// MARK: PREVIEW
struct ContentView_Previews : PreviewProvider {
	static var previews: some View {
		ContentView()
			.previewDevice("iPhone 13")
	}
}
