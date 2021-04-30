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
                Button("Small", action : {
                    self.filter.clear()
                    self.filter.size = 1
                })
                Button("Average", action: {
                    self.filter.clear()
                    self.filter.size = 2
                })
                Button("Large", action: {
                    self.filter.clear()
                    self.filter.size = 3
                })
            }
            Menu(ResortFilter.type.price.description) {
                Button("$", action: {
                    self.filter.clear()
                    self.filter.price = 1
                })
                Button("$$", action: {
                    self.filter.clear()
                    self.filter.price = 2
                })
                Button("$$$", action: {
                    self.filter.clear()
                    self.filter.price = 3
                })
            }
            Menu(ResortFilter.type.country.description) {
                Button(action: {
                    self.filter.clear()
                    self.filter.country = "Austria"
                }) {
                    Label("Austria", image: "Austria")
                }
                Button(action: {
                    self.filter.clear()
                    self.filter.country = "Canada"
                }) {
                    Label("Canada", image: "Canada")
                }
                Button(action: {
                    self.filter.clear()
                    self.filter.country = "France"
                }) {
                    Label("France", image: "France")
                }
                Button(action: {
                    self.filter.clear()
                    self.filter.country = "Italy"
                }) {
                    Label("Italy", image: "Italy")
                }
                Button(action: {
                    self.filter.clear()
                    self.filter.country = "United States"
                }) {
                    Label("United States", image: "United States")
                }
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
