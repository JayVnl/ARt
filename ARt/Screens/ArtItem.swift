//
//  ArtItem.swift
//  ARt
//
//  Created by Danny Vu on 12/01/2022.
//

import SwiftUI

struct ArtItem: View {
    var title: String
    var image: String
    var author: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 250)
                .cornerRadius(5)
            Text(title)
                .font(.caption)
            Text(author)
                .font(.caption)
                .italic()
        }
        .padding(.leading, 15)
    }
}

struct ArtItem_Previews: PreviewProvider {
    static var previews: some View {
        ArtItem(title: "Children Yellow", image: "children_yellow", author: "author")
    }
}
