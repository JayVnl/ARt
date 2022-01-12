//
//  ArtCarousel.swift
//  ARt
//
//  Created by Danny Vu on 12/01/2022.
//

import SwiftUI

struct ArtCarousel: View {
    var categoryName: String
    var items: [Art]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.largeTitle)
                .padding(.leading, 15)
                .padding(.top,  5)
            
            ScrollView(.horizontal,  showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { art in
                        ArtItem(title: art.title, image: art.imageName, author: art.author)
                    }
                }
            }
        }
    }
}

struct ArtCarousel_Previews: PreviewProvider {
    static var previews: some View {
        ArtCarousel(categoryName: "Test", items: [Art](repeating: Art(id: 0, title: "Children Yellow", author: "author", imageName: "children_yellow"), count: 5))
    }
}
