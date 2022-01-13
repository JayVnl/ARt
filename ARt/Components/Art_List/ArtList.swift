//
//  ArtList.swift
//  ARt
//
//  Created by Danny Vu on 12/01/2022.
//

import SwiftUI

struct ArtList: View {
    var categoryName: String
    var items: [Art]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.largeTitle)
                .padding(.leading, 15)
                .padding(.top,  5)
            
                VStack {
                    ForEach(items) { art in
                        ArtListItem(title: art.title, image: art.imageName, author: art.author, size: art.size!, type: art.type!, year: art.year!)
                    }
                }
        }
    }
}

struct ArtList_Previews: PreviewProvider {
    static var previews: some View {
        ArtList(categoryName: "Test", items: [Art](repeating: Art(id: 0, title: "Children Yellow", author: "author", imageName: "children_yellow", size: "10x12", type: "Schilderij", year: "2001"), count: 5))
    }
}
