//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Shane on 19/04/2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var favourites = Favourites()
    @State private var sort: ResortSort = .standard
    @State private var filter = ResortFilter()
    
    @State private var showingSortActionSheet = false
    
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    var filteredAndSortedResorts: [Resort] {
        var sortedAndFilteredResorts = resorts
        sortedAndFilteredResorts.sort(by: { (lhs, rhs) -> Bool in
            switch self.sort {
            case .alphabetical:
                return lhs.name < rhs.name
            case .country:
                return lhs.country < rhs.country
            default:
                return true
            }
        })
        if self.filter.isSet() {
            sortedAndFilteredResorts = self.filter.filter(resorts: sortedAndFilteredResorts)
        }
        return sortedAndFilteredResorts
    }
    
    var body: some View {
        NavigationView {
            List(filteredAndSortedResorts) { resort in
                NavigationLink(destination: ResortView(resort: resort)) {
                    Image(resort.country)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 25)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 5)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.black, lineWidth: 1)
                        )
                    
                    VStack(alignment: .leading) {
                        Text(resort.name)
                            .font(.headline)
                        
                        Text("\(resort.runs) runs")
                            .foregroundColor(.secondary)
                    }
                    
                    if self.favourites.contains(resort) {
                        Spacer()
                        Image(systemName: "heart.fill")
                            .accessibility(label: Text("This is a favourite resort"))
                            .foregroundColor(.red)
                    }
                }
                
            }
            .navigationBarTitle("Resorts")
            .navigationBarItems(
                leading: Menu {
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
                } label: { Label("", systemImage: "line.horizontal.3.decrease.circle")},
                trailing: Button(action: {
                    self.showingSortActionSheet = true
                }){
                    Image(systemName: "arrow.up.arrow.down.circle")
                }
            )
            .actionSheet(isPresented: $showingSortActionSheet, content: {
                ActionSheet(title: Text("Change sort order"), message: Text("Select a sort order"), buttons: [
                    .default(Text(ResortSort.alphabetical.description)) { self.sort = ResortSort.alphabetical },
                    .default(Text(ResortSort.country.description)) { self.sort = ResortSort.country },
                    .default(Text(ResortSort.standard.description)) { self.sort = ResortSort.standard },
                    .cancel()
                ])
            })
            
            WelcomeView()
        }
        .environmentObject(favourites)
    }
}

extension View {
    func phoneOnlyStackNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return AnyView(self.navigationViewStyle(StackNavigationViewStyle()))
        } else {
            return AnyView(self)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
