//
//  Header.swift
//  ARt
//
//  Created by Jorrit Verstappen on 13/01/2022.
//

import SwiftUI

struct Header: View {
	// MARK: PROPERTIES
	
	// MARK: BODY
	var body: some View {
		ZStack(alignment: .top) {
			Image(uiImage: UIImage(named: "headerbg")!).resizable().scaledToFit()
			VStack(alignment: .leading, spacing: 0) {
				HStack {
					Button(action: {}, label: {
						Image(systemName: "magnifyingglass")
							.font(.title2)
							.foregroundColor(.black)
							.rotationEffect(.degrees(-45))
					}) //: BUTTON
						.padding(.all, 8)
						.background(.white)
						.rotationEffect(.degrees(45))
				} //: HSTACK
				.frame(
					minWidth: 0,
					maxWidth: .infinity,
					minHeight: 100,
					alignment: .bottomTrailing
				)
				.padding(.trailing, 30)
				
				Text("ARt")
					.foregroundColor(.white)
					.fontWeight(.bold)
					.font(Font.system(size: 80, design: .serif))
					.padding(.leading, 20)
					.padding(.top, 10)
				
				Text("Bezichtig kunst op voorhand")
					.foregroundColor(.white)
					.fontWeight(.semibold)
					.font(Font.system(size: 20))
					.padding(.leading, 20)
				
			} //: VSTACK
		}
	}
}

// MARK: PREVIEW
struct Header_Previews: PreviewProvider {
    static var previews: some View {
			Header().previewLayout(.sizeThatFits)
    }
}
