//
//  ResortFilterMenuButtonSize.swift
//  SnowSeeker
//
//  Created by Shane on 01/05/2021.
//

import SwiftUI

struct ResortFilterMenuButtonSize: View {
    @ObservedObject var filter: ResortFilter
    let size: Int
    
    var sizeString: String {
        switch size {
        case 1:
            return "Small"
        case 2:
            return "Average"
        default:
            return "Large"
        }
    }
    
    var body: some View {
        Button(action: {
            self.filter.clear()
            self.filter.size = size
        }) {
            
            if self.filter.size == self.size {
                Label("\(sizeString)", systemImage: "star.fill")
            } else {
                Text("\(sizeString)")
            }
        }
    }
}

struct ResortFilterMenuButtonSize_Previews: PreviewProvider {
    static var previews: some View {
        ResortFilterMenuButtonSize(filter: ResortFilter(), size: 1)
    }
}
