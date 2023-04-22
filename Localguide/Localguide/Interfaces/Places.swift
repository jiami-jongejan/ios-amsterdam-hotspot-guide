//
//  Places.swift
//  Localguide
//
//  Created by Jiami Jongejan on 23/4/2023.
//

import Foundation

struct Place:Codable{
    let name: String
    let description: String
    let image: String
    let keywords: [String]
    let neighbourhood: String
    let coordinates: [Float]
}
