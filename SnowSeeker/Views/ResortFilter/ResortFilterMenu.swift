//
//  ResortFilterMenu.swift
//  SnowSeeker
//
//  Created by Shane on 30/04/2021.
//

import SwiftUI

struct ResortFilterMenu: View {
    @ObservedObject var filter: ResortFilter
    var body: some View {
        Menu {
            Menu {
                ResortFilterMenuButtonSize(filter: filter, size: 1)
                ResortFilterMenuButtonSize(filter: filter, size: 2)
                ResortFilterMenuButtonSize(filter: filter, size: 3)
            } label: {
                if filter.isSizeSet() {
                    Label("\(ResortFilter.type.size.description)", systemImage: "star.fill")
                } else {
                    Text("\(ResortFilter.type.size.description)")
                }
            }
            Menu {
                ResortFilterMenuButtonPrice(filter: filter, price: 1)
                ResortFilterMenuButtonPrice(filter: filter, price: 2)
                ResortFilterMenuButtonPrice(filter: filter, price: 3)
            } label: {
                if filter.isPriceSet() {
                    Label("\(ResortFilter.type.price.description)", systemImage: "star.fill")
                } else {
                    Text("\(ResortFilter.type.price.description)")
                }
            }
            Menu {
                ResortFilterMenuButtonCountry(filter: filter, country: "Austria")
                ResortFilterMenuButtonCountry(filter: filter, country: "Canada")
                ResortFilterMenuButtonCountry(filter: filter, country: "France")
                ResortFilterMenuButtonCountry(filter: filter, country: "Italy")
                ResortFilterMenuButtonCountry(filter: filter, country: "United States")
            } label: {
                if filter.isCountrySet() {
                    Label("\(ResortFilter.type.country.description)", systemImage: "star.fill")
                } else {
                    Text("\(ResortFilter.type.country.description)")
                }
            }
            Button("Clear filter", action: {
                filter.clear()
            })
        } label: {
            if filter.isSet() {
                Label("", systemImage: "line.horizontal.3.decrease.circle.fill")
            } else {
                Label("", systemImage: "line.horizontal.3.decrease.circle")
                
            }
        }
    }
}

struct ResortFilterMenu_Previews: PreviewProvider {
    static var previews: some View {
        ResortFilterMenu(filter: ResortFilter())
    }
}
