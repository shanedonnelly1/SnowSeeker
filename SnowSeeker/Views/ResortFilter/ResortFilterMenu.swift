//
//  ResortFilterMenu.swift
//  SnowSeeker
//
//  Created by Shane on 30/04/2021.
//

import SwiftUI

struct ResortFilterMenu: View {
    var filter: ResortFilter
    var body: some View {
        Menu {
            Menu(ResortFilter.type.size.description) {
                ResortFilterMenuButtonSize(filter: self.filter, size: 1)
                ResortFilterMenuButtonSize(filter: self.filter, size: 2)
                ResortFilterMenuButtonSize(filter: self.filter, size: 3)
            }
            Menu(ResortFilter.type.price.description) {
                ResortFilterMenuButtonPrice(filter: self.filter, price: 1)
                ResortFilterMenuButtonPrice(filter: self.filter, price: 2)
                ResortFilterMenuButtonPrice(filter: self.filter, price: 3)
            }
            Menu(ResortFilter.type.country.description) {
                ResortFilterMenuButtonCountry(filter: self.filter, country: "Austria")
                ResortFilterMenuButtonCountry(filter: self.filter, country: "Canada")
                ResortFilterMenuButtonCountry(filter: self.filter, country: "France")
                ResortFilterMenuButtonCountry(filter: self.filter, country: "Italy")
                ResortFilterMenuButtonCountry(filter: self.filter, country: "United States")
            }
            Button("Clear filter", action: {
                self.filter.clear()
            })
        } label: { Label("", systemImage: "line.horizontal.3.decrease.circle")}
    }
}

struct ResortFilterMenu_Previews: PreviewProvider {
    static var previews: some View {
        ResortFilterMenu(filter: ResortFilter())
    }
}
