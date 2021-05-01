//
//  ResortFilterMenuButtonCountry.swift
//  SnowSeeker
//
//  Created by Shane on 01/05/2021.
//

import SwiftUI

struct ResortFilterMenuButtonCountry: View {
    let filter: ResortFilter
    let country: String
    
    var body: some View {
        Button(action: {
            self.filter.clear()
            self.filter.country = country
        }) {
            Label(country, image: country)
        }
    }
}

struct ResortFilterMenuButtonCountry_Previews: PreviewProvider {
    static var previews: some View {
        ResortFilterMenuButtonCountry(filter: ResortFilter(), country: "Canada")
    }
}
