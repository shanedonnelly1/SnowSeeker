//
//  ResortSort.swift
//  SnowSeeker
//
//  Created by Shane on 28/04/2021.
//

import Foundation

enum ResortSort: CustomStringConvertible {
    case alphabetical, country, standard
    var description: String {
        switch self {
        case .alphabetical:
            return "Alphabetical"
        case .country:
            return "Country"
        default:
            return "Default"
        }
    }
}
