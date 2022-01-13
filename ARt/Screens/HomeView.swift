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
