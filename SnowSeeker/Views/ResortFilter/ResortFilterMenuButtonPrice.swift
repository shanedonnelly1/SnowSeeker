//
//  ResortFilterMenuButtonPrice.swift
//  SnowSeeker
//
//  Created by Shane on 01/05/2021.
//

import SwiftUI

struct ResortFilterMenuButtonPrice: View {
    let filter: ResortFilter
    let price: Int
    
    var body: some View {
        Button(String(repeating: "$", count: price), action: {
            self.filter.clear()
            self.filter.price = price
        })
    }
}

struct ResortFilterMenuButtonPrice_Previews: PreviewProvider {
    static var previews: some View {
        ResortFilterMenuButtonPrice(filter: ResortFilter(), price: 2)
    }
}
