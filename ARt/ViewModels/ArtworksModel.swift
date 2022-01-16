//
//  ArtworksModel.swift
//  ARt
//
//  Created by Jorrit Verstappen on 12/01/2022.
//

import Foundation
import SwiftUI

class ArtworksModel: ObservableObject {
	@Published var artworks: ArtworksResponse?
	@Published var initialLoad: Bool = true
	@Published var selectedArtworkImage: String?
	
	init() {
		// MAKE THE REQUEST TO THE API
		let session = URLSession.shared
		
		// API URL TO RETRIEVE ARTWORKS
		guard let url = URL(string: "https://api.artsy.net/api/artworks?size=10&offset=129") else {
			print("Invalid URL")
			return
		}
		
		// SETTING UP THE REQUEST WITH THE REQUIRED ACCESSTOKEN
		var request = URLRequest(url: url)
		request.setValue("eyJhbGciOiJIUzI1NiJ9.eyJyb2xlcyI6IiIsInN1YmplY3RfYXBwbGljYXRpb24iOiI2MWRlMDE3Nzg1Yzc2NDAwMGNlNWJlOWQiLCJleHAiOjE2NDI1OTcxNTksImlhdCI6MTY0MTk5MjM1OSwiYXVkIjoiNjFkZTAxNzc4NWM3NjQwMDBjZTViZTlkIiwiaXNzIjoiR3Jhdml0eSIsImp0aSI6IjYxZGVkMGE3Nzk1MjRkMDAwYmUxYjhhMyJ9.xy7ZuXNka1l__WfcAiUUJ7P0mdxoHPDsaiA05EbSYO0", forHTTPHeaderField: "X-Xapp-Token")
		request.setValue("application/vnd.artsy-v2+json", forHTTPHeaderField: "Accept")
		
		// EXECUTING THE API CALL
		let task = session.dataTask(with: request) { data, response, error in
			
			// CHECK WHETHER DATA IS OBTAINED AND THERE ARE NO ERRORS
			if data != nil && error == nil {

				let decoder = JSONDecoder()

				do {
					// PARSE THE RESPONSE INTO ARTWORK OBJECTS
					let artworksResponse = try decoder.decode(ArtworksResponse.self, from: data!)

					// UPDATE THE UI FROM THE MAIN THREAD
					DispatchQueue.main.async {
						// SET THE ARTWORK PROPERTY WITH THE PARSED OBJECTS
						self.artworks = artworksResponse
					}
				}
				catch {
					print("API call failed")
				}

			}
		}
		task.resume()
	}
}
