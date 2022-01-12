//
//  HomeView.swift
//  ARt
//
//  Created by Jorrit Verstappen on 12/01/2022.
//

import SwiftUI

struct HomeView: View {
	var body: some View {
		NavigationView {
			VStack {
				Text("Hello World")
				NavigationLink(destination: ARtView()) {
					Text("Go To Next Step")
				}
			}
		}
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
	}
}
