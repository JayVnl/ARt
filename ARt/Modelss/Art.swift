//
//  Art.swift
//  ARt
//
//  Created by Danny Vu on 12/01/2022.
//

import Foundation
import SwiftUI

struct Art: Hashable, Codable, Identifiable {
	var id: Int
	var title: String
	var author: String
	var imageName: String
	
	var size: String?
	var type: String?
	var year: String?
}
