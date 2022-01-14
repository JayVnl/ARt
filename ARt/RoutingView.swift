//
//  RoutingView.swift
//  ARt
//
//  Created by Jorrit Verstappen on 14/01/2022.
//

import SwiftUI
import SwiftUIRouter

struct RoutingView: View {
	// MARK: PROPERTIES
	
	// MARK: BODY
	var body: some View {
		RootRoutes()
	}
}

private struct RootRoutes: View {
	// MARK: PROPERTIES
	
	// MARK: BODY
	var body: some View {
		SwitchRoutes {
			
			Route("home", content: HomeView())
			
			Route("arview", content: ARtView())
			
			Route {
				Navigate(to: "/home", replace: true)
			}
		}
	}
}

// MARK: PREVIEW
struct RoutingView_Previews: PreviewProvider {
	static var previews: some View {
		RoutingView()
	}
}
