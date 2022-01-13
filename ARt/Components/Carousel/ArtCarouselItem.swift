//
//  ArtItem.swift
//  ARt
//
//  Created by Danny Vu on 12/01/2022.
//

import SwiftUI

struct ArtCarouselItem: View {
	// MARK: PROPERTIES
	var title: String
	var image: String
	var author: String
	
	// MARK: BODY
	var body: some View {
		VStack(alignment: .leading) {
			Image(image)
				.resizable()
				.scaledToFill()
				.frame(width: 150, height: 250)
				.cornerRadius(5)
			Text(title)
				.font(Font.system(size: 17))
				.fontWeight(.medium)
			Text(author)
				.font(Font.system(size: 15))
				.opacity(0.7)
		}
	}
}

// MARK: PREVIEW
struct ArtItem_Previews: PreviewProvider {
	static var previews: some View {
		ArtCarouselItem(title: "Children Yellow", image: "children_yellow", author: "author").previewLayout(.sizeThatFits)
	}
}