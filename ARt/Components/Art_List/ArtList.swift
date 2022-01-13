//
//  ArtList.swift
//  ARt
//
//  Created by Danny Vu on 12/01/2022.
//

import SwiftUI

struct ArtList: View {
	var categoryName: String
	var items: [Art]
	
	var body: some View {
		VStack(alignment: .leading) {
			Text(categoryName)
				.font(Font.system(size: 32, design: .serif))
				.fontWeight(.medium)
			
			VStack(spacing: 20) {
				ForEach(items) { art in
					ArtListItem(title: art.title, image: art.imageName, author: art.author, size: art.size!, type: art.type!, year: art.year!)
				}
			}
		}
		.padding(.horizontal, 20)
	}
}

struct ArtList_Previews: PreviewProvider {
	static var previews: some View {
		ArtList(categoryName: "Test", items: [Art](repeating: Art(id: 0, title: "Children Yellow", author: "Kunstenaar", imageName: "children_yellow", size: "40 x 30 cm", type: "Schilderij", year: "2001"), count: 5)).previewLayout(.sizeThatFits)
	}
}
