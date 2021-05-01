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
    @ObservedObject var filter = ResortFilter()
    
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
                leading: ResortFilterMenu(filter: filter),
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
