//
//  HomeView.swift
//  ARt
//
//  Created by Danny Vu on 12/01/2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            List {
                ArtCarousel(categoryName: "Uitgelichte Kunst", items: [Art](repeating: Art(id: 0, title: "Children Yellow", author: "author", imageName: "children_yellow"), count: 5))
                    .listRowInsets(EdgeInsets())
                
                ArtList(categoryName: "Uitgelichte Kunst", items: [Art](repeating: Art(id: 0, title: "Children Yellow", author: "author", imageName: "children_yellow", size: "10x12", type: "Schilderij", year: "2001"), count: 5))
                    .listRowInsets(EdgeInsets())
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
