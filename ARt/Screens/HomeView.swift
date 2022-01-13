//
//  HomeView.swift
//  ARt
//
//  Created by Jorrit Verstappen on 12/01/2022.
//

import SwiftUI

struct HomeView: View {
	@ObservedObject var model = ArtworksModel()
	
	var body: some View {
//		ZStack {
//			ScrollView {
//				VStack(spacing: 20) {
//					Header()
//					
//					ArtCarousel(categoryName: "Uitgelichte Kunst", items: [Art](repeating: Art(id: 0, title: "Children Yellow", author: "Kunstenaar", imageName: "children_yellow"), count: 5))
//						.listRowInsets(EdgeInsets())
//					
//					ArtList(categoryName: "Recent toegevoegd", items: [Art](repeating: Art(id: 0, title: "Children Yellow", author: "Kunstenaar", imageName: "children_yellow", size: "10x12", type: "Schilderij", year: "2001"), count: 5))
//						.listRowInsets(EdgeInsets())
		
		if let artworks = model.artworks {
			// DISPLAY ARTWORKS
			List{
				ForEach(artworks._embedded.artworks, id: \.id) { artwork in
					HStack {
						AsyncImage(url: URL(string: artwork._links.thumbnail.href)) { image in
								image.resizable().scaledToFill()
						} placeholder: {
								ProgressView()
						}
						.frame(width: 50, height: 50)
						.padding(.trailing, 10)
						VStack(alignment: .leading){
							Text(artwork.title)
								.font(.headline)
							Text(artwork.category)
								.font(.body)
							Text(artwork.date)
								.font(.body)
							Text(artwork.dimensions.cm.text)
								.font(.body)
						}
					}
				}
			}
//		}.ignoresSafeArea(.all, edges: .top)
		}
		else {
			ProgressView()
		}
		
		//		NavigationView {
		//			VStack {
		//				Text("Hello World")
		//				NavigationLink(destination: ARtView()) {
		//					Text("Go To Next Step")
		//				}
		//			}
		//		}
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
	}
}
