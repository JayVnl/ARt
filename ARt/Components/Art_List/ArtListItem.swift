//
//  ArtListItem.swift
//  ARt
//
//  Created by Danny Vu on 12/01/2022.
//

import SwiftUI

struct ArtListItem: View {
    var title: String
    var image: String
    var author: String
    var size: String
    var type: String
    var year: String
    
    var body: some View {
        HStack (alignment: .top){
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
                .cornerRadius(5)
            VStack (alignment: .leading){
                Text(title)
                    .font(.headline)
                Text(author)
                    .font(.caption2)
                    .italic()
                    .padding(.bottom)
                Text("Info")
                    .font(.caption)
                Text(size)
                    .font(.caption2)
                    .italic()
                Text(type)
                    .font(.caption2)
                    .italic()
                Text(year)
                    .font(.caption2)
                    .italic()
            }
        }
    }
}

struct ArtListItem_Previews: PreviewProvider {
    static var previews: some View {
        ArtListItem(title: "Children Yellow", image: "children_yellow", author: "author",  size: "10x12", type:"Schilderij", year: "2001")
    }
}
