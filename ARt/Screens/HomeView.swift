//
//  HomeView.swift
//  ARt
//
//  Created by Jorrit Verstappen on 12/01/2022.
//

import SwiftUI

struct HomeView: View {
	// MARK: PROPERTIES
	@ObservedObject var model = ArtworksModel()
	
	// MARK: BODY
	var body: some View {
		ZStack {
			ScrollView {
				VStack(spacing: 20) {
					Header()
					
					if let artworks = model.artworks {
						ArtCarousel(categoryName: "Uitgelichte Kunst", artworks: artworks._embedded.artworks)
					}
					else {
						ProgressView()
					}
					
//					ArtList(categoryName: "Recent toegevoegd", items: [Art](repeating: Art(id: 0, title: "Children Yellow", author: "Kunstenaar", imageName: "children_yellow", size: "10x12", type: "Schilderij", year: "2001"), count: 5))
				}
			}
		}.ignoresSafeArea(.all, edges: .top)
	}
}

// MARK: PREVIEW
struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
	}
}
