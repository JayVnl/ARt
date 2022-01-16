//
//  ArtListItem.swift
//  ARt
//
//  Created by Danny Vu on 12/01/2022.
//

import SwiftUI
import SwiftUIRouter

struct ArtListItem: View {
	// MARK: PROPERTIES
	@EnvironmentObject private var navigator: Navigator
	@EnvironmentObject private var model: ArtworksModel
	
	var index: Int?
	var title: String
	var image: String
	var author: String
	var size: String
	var type: String
	var year: String
	
	// MARK: BODY
	var body: some View {
		let width = (UIScreen.main.bounds.width * 0.5) - 30
		
		let titleTrimmed = title.components(separatedBy: CharacterSet.punctuationCharacters).joined(separator: "")
		let authorSlug = author.dropLast(titleTrimmed.count + 1)
		let author = authorSlug.replacingOccurrences(of: "-", with: " ").capitalized
		
		HStack (alignment: .center, spacing: 20) {
			AsyncImage(url: URL(string: image)) { image in
				image.resizable().scaledToFill().frame(width: width, height: width, alignment: .center).clipped()
			} placeholder: {
				ProgressView()
			}
			.onTapGesture {
				model.selectedArtworkImage = image
				navigator.navigate("/arview")
			}
			
			VStack (alignment: .leading) {
				Text(title)
					.font(Font.system(size: 17))
					.fontWeight(.medium)
				Text(author != "" ? author : "Onbekend")
					.font(Font.system(size: 15))
					.padding(.bottom, 13)
					.opacity(0.7)
				Text("Info")
					.font(Font.system(size: 17))
					.fontWeight(.medium)
				Text(size)
					.font(Font.system(size: 15))
					.opacity(0.7)
				Text(type)
					.font(Font.system(size: 15))
					.opacity(0.7)
				Text(year)
					.font(Font.system(size: 15))
					.opacity(0.7)
			}
		}
		.frame(minWidth: 0, maxWidth: .infinity, maxHeight: width, alignment: .leading)
		.environment(\.layoutDirection, (index ?? 0) % 2 == 0 ? .leftToRight : .rightToLeft)
		.onTapGesture {
			print("Clicked \(title)")
		}
	}
}

// MARK: PREVIEW
struct ArtListItem_Previews: PreviewProvider {
	static var previews: some View {
		ArtListItem(title: "Children Yellow", image: "children_yellow", author: "author",  size: "10x12", type:"Schilderij", year: "2001").previewLayout(.sizeThatFits)
	}
}
