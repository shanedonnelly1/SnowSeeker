//
//  ResortFilter.swift
//  SnowSeeker
//
//  Created by Shane on 28/04/2021.
//

import SwiftUI

struct ResortFilter {
    var country: String?
    var price: Int?
    var size: Int?
    var logicalAnd = false
    var type: type = .none
   
    mutating func clear() {
        country = nil
        price = nil
        size = nil
        self.type = .none
    }
    
    func isSet() -> Bool {
        return country != nil || price != nil || size != nil
    }
    
    func filter(resorts: [Resort]) -> [Resort] {
        return resorts.filter {
            if let country = self.country {
                return country == $0.country
            } else if let price = self.price {
                return price == $0.price
            } else if let size = self.size {
                return size == $0.size
            } else {
                return false
            }
        }
    }
    
    enum type: CustomStringConvertible {
        case country, price, size, none
        var description: String {
            switch self {
            case .country:
                return "Country"
            case .price:
                return "Price"
            case .size:
                return "Size"
            default:
                return "None"
            }
        }
    }
}

