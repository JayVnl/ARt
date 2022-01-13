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
		let width = UIScreen.main.bounds.width * 0.45
		let height = width * 1.5
		
		VStack(alignment: .leading) {
			AsyncImage(url: URL(string: image)) { image in
				image.resizable().scaledToFill().frame(width: width, height: height, alignment: .center).clipped()
			} placeholder: {
				ProgressView()
			}
			Text(title)
				.font(Font.system(size: 17))
				.fontWeight(.medium)
			Text(author)
				.font(Font.system(size: 15))
				.opacity(0.7)
		}
		.frame(width: width)
	}
}

// MARK: PREVIEW
struct ArtItem_Previews: PreviewProvider {
	static var previews: some View {
		ArtCarouselItem(title: "Children Yellow", image: "children_yellow", author: "author").previewLayout(.sizeThatFits)
	}
}
