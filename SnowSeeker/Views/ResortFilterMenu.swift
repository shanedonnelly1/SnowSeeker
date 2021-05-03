//
//  ResortFilterMenu.swift
//  SnowSeeker
//
//  Created by Shane on 30/04/2021.
//

import SwiftUI

struct ResortFilterMenu: View {
    @ObservedObject var filter: ResortFilter
    let countries = ["Austria", "Canada", "France", "Italy", "United States"]
    let sizes = [1: "Small", 2: "Average", 3: "Large"]
    
    var body: some View {
        let size = Binding(
            get: { filter.size ?? 0 },
            set: {
                filter.clear()
                filter.size = $0
            }
        )
        let price = Binding(
            get: { filter.price ?? 0 },
            set: {
                filter.clear()
                filter.price = $0
            }
        )
        let country = Binding(
            get: { filter.country ?? "" },
            set: {
                filter.clear()
                filter.country = $0
            }
        )
        return Menu {
            Menu(ResortFilter.type.size.description) {
                Picker(selection: size, label: Text("Filter by size"), content: {
                    ForEach(sizes.sorted(by: >), id: \.key) { key, value in
                        Text(value).tag(key)
                    }
                })
            }
            Menu(ResortFilter.type.price.description) {
                Picker(selection: price, label: Text("Filter by price"), content: {
                    ForEach((1...3), id: \.self) {
                        Text(String(repeating: "$", count: $0)).tag($0)
                    }
                })
            }
            Menu(ResortFilter.type.country.description) {
                Picker(selection: country, label: Text("Filter by price"), content: {
                    ForEach(countries, id: \.self) {
                        Label("\($0)", image: "\($0)").tag("\($0)")
                    }
                    
                })
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
