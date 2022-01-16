//
//  HomeView.swift
//  ARt
//
//  Created by Jorrit Verstappen on 12/01/2022.
//

import SwiftUI

struct HomeView: View {
	// MARK: PROPERTIES
//	@ObservedObject var model = ArtworksModel()
	@EnvironmentObject private var model: ArtworksModel
	
	// MARK: BODY
	var body: some View {
		ZStack {
			if !model.initialLoad {
				FancyScrollView(headerHeight: 252,
												scrollUpHeaderBehavior: .sticky,
												scrollDownHeaderBehavior: .offset,
												header: { Header().aspectRatio(contentMode: .fill) }) {
					VStack(spacing: 20) {
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
					}.padding(.top, 20)
				}
			} else {
				Image(uiImage: UIImage(named: "splashbg")!).resizable().scaledToFit().frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height).ignoresSafeArea()
			}
		}.onAppear {
			DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
				withAnimation {
					model.initialLoad = false
				}
			}
		}
	}
}

// MARK: PREVIEW
struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
	}
}
