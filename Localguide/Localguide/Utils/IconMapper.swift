//
//  IconMapper.swift
//  Localguide
//
//  Created by Jiami Jongejan on 22/2/2024.
//

import Foundation

struct IconMapper {
    static func iconName(forCategory category: String) -> String {
        switch category.lowercased() {
        // categories
        case "restaurant":
            return "fork.knife"
        case "bar":
            return "wineglass.fill"
        case "coffee":
            return "cup.and.saucer.fill"
        case "party":
            return "party.popper.fill"
        case "outdoor":
            return "sun.min.fill"
        case "fancy":
            return "wand.and.stars"
        case "hipster":
            return "mustache.fill"
        // keywords
        case "cozy":
            return "fireplace.fill"
        case "summer":
            return "sun.max.fill"
        default:
            return "questionmark.circle"
        }
    }
}
