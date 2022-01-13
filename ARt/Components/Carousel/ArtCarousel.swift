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
	var items: [Art]
	
	// MARK: BODY
	var body: some View {
		VStack(alignment: .leading) {
			Text(categoryName)
				.font(Font.system(size: 32, design: .serif))
				.fontWeight(.medium)
				.padding(.leading, 20)
			
			ScrollView(.horizontal,  showsIndicators: false) {
				HStack(alignment: .top, spacing: 20) {
					ForEach(items) { art in
						ArtCarouselItem(title: art.title, image: art.imageName, author: art.author)
					}
				}
				.padding(.horizontal, 20)
			}
		}
	}
}

// MARK: PREVIEW
struct ArtCarousel_Previews: PreviewProvider {
	static var previews: some View {
		ArtCarousel(categoryName: "Test", items: [Art](repeating: Art(id: 0, title: "Children Yellow", author: "author", imageName: "children_yellow"), count: 5)).previewLayout(.sizeThatFits)
	}
}
