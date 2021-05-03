//
//  TestView.swift
//  SnowSeeker
//
//  Created by Shane on 01/05/2021.
//

import SwiftUI

struct TestView: View {
    @StateObject var filter = ResortFilter()
    
    var body: some View {
        let size = Binding(
            get: { filter.size ?? 0 },
            set: { filter.size = $0 }
        )
        return NavigationView {
            VStack {
                if let s = filter.size {
                    Text("Size: \(s)")
                } else {
                    Text("Size: 0")
                }
            }
            .navigationBarItems(
                trailing:
                    Menu {
                        Picker(selection: size, label: Text("Size"), content: {
                            Text("Small").tag(1)
                            Text("Average").tag(2)
                            Text("Large").tag(3)
                        })
                    } label: {
                        Label("Size", systemImage: "number.circle")
                    }
            )
            
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView(filter: ResortFilter())
    }
}
