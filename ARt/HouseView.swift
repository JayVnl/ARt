//
//  HouseView.swift
//  ARt
//
//  Created by Danny Vu on 12/01/2022.
//

import SwiftUI

struct HouseView: View {
	// MARK: PROPERTIES
	
	// MARK: BODY
	var body: some View {
		ZStack {
			ScrollView {
				VStack(spacing: 20) {
					Header()
					
					ArtCarousel(categoryName: "Uitgelichte Kunst", items: [Art](repeating: Art(id: 0, title: "Children Yellow", author: "Kunstenaar", imageName: "children_yellow"), count: 5))
						.listRowInsets(EdgeInsets())
					
					ArtList(categoryName: "Recent toegevoegd", items: [Art](repeating: Art(id: 0, title: "Children Yellow", author: "Kunstenaar", imageName: "children_yellow", size: "10x12", type: "Schilderij", year: "2001"), count: 5))
						.listRowInsets(EdgeInsets())
				}
			}
		}.ignoresSafeArea(.all, edges: .top)
	}
}

// MARK: PREVIEW
struct HouseView_Previews: PreviewProvider {
	static var previews: some View {
		HouseView()
	}
}
