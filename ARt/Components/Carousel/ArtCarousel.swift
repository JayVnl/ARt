//
//  ArtCarousel.swift
//  ARt
//
//  Created by Danny Vu on 12/01/2022.
//

import SwiftUI

struct ArtCarousel: View {
	// MARK: PROPERTIES
	var categoryName: String
	var artworks: [Artwork]
	
	// MARK: BODY
	var body: some View {
		VStack(alignment: .leading) {
			Text(categoryName)
				.font(Font.system(size: 32, design: .serif))
				.fontWeight(.medium)
				.padding(.leading, 20)
			
			ScrollView(.horizontal,  showsIndicators: false) {
				HStack(alignment: .top, spacing: 20) {
					ForEach(0..<5) { i in
						let artwork = self.artworks[i]
						
						ArtCarouselItem(title: artwork.title, image: artwork._links.thumbnail.href, author: artwork.slug)
					}
				}.padding(.horizontal, 20)
			}
		}
	}
}

// MARK: PREVIEW
struct ArtCarousel_Previews: PreviewProvider {
	static var previews: some View {
		ArtCarousel(categoryName: "Test", artworks: [Artwork](repeating: Artwork(id: "1", slug: "iets", title: "Kunstwerk", category: "Schilderij", date: "2022", dimensions: Artwork.DimensionType(cm: Artwork.DimensionType.Dimension(text: "Iets")), _links: Artwork.Link(thumbnail: Artwork.Link.ImageURL(href: "https://picsum.photos/400/600"))), count: 5)).previewLayout(.sizeThatFits)
	}
}
