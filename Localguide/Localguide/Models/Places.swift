//
//  Places.swift
//  Localguide
//
//  Created by Jiami Jongejan on 23/4/2023.
//

import Foundation

struct Place:Codable, Identifiable{
    let id = UUID()
    let _id: String
    let name: String
    let description: String
    let image: String
    let keywords: [String]
    let neighbourhood: String
    let coordinates: [Float]
    let address: String
    let rating: String
}

struct Category: Hashable {
    let name, imgName: String
}
