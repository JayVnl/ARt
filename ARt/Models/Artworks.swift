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
			var title: String
		}
	}
}
