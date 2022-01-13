//
//  Artworks.swift
//  ARt
//
//  Created by Jorrit Verstappen on 12/01/2022.
//

import Foundation

struct ArtworksResponse: Decodable {
	var _embedded: Artworks
	
	struct Artworks: Decodable {
		var artworks: [Artwork]
		
		struct Artwork: Decodable {
			var id: String
			var slug: String
			var title: String
			var category: String
			var date: String
			var dimensions: DimensionType
			
			struct DimensionType: Decodable {
				var cm: Dimension
				
				struct Dimension: Decodable {
					var text: String
				}
			}
		}
	}
}
