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
					
					if let artworks = model.artworks {
						ArtList(categoryName: "Recent toegevoegd", artworks: artworks._embedded.artworks)
					}
					else {
						ProgressView()
					}
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
