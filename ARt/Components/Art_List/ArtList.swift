//
//  ArtList.swift
//  ARt
//
//  Created by Danny Vu on 12/01/2022.
//

import SwiftUI

struct ArtList: View {
	// MARK: PROPERTIES
	var categoryName: String
	var items: [Art]
	
	// MARK: BODY
	var body: some View {
		VStack(alignment: .leading) {
			Text(categoryName)
				.font(Font.system(size: 32, design: .serif))
				.fontWeight(.medium)
			
			VStack(spacing: 20) {
				ForEach(0..<items.count) { i in
					let artwork = self.items[i]
					ArtListItem(index: i, title: artwork.title, image: artwork.imageName, author: artwork.author, size: artwork.size!, type: artwork.type!, year: artwork.year!)
				}
			}
		}
		.padding(.horizontal, 20)
	}
}

// MARK: PREVIEW
struct ArtList_Previews: PreviewProvider {
	static var previews: some View {
		ArtList(categoryName: "Test", items: [Art](repeating: Art(id: 0, title: "Children Yellow", author: "Kunstenaar", imageName: "children_yellow", size: "40 x 30 cm", type: "Schilderij", year: "2001"), count: 5)).previewLayout(.sizeThatFits)
	}
}
