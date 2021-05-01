//
//  ResortFilterMenuButtonSize.swift
//  SnowSeeker
//
//  Created by Shane on 01/05/2021.
//

import SwiftUI

struct ResortFilterMenuButtonSize: View {
    let filter: ResortFilter
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
        Button(sizeString, action: {
            self.filter.clear()
            self.filter.size = size

        })
    }
}

struct ResortFilterMenuButtonSize_Previews: PreviewProvider {
    static var previews: some View {
        ResortFilterMenuButtonSize(filter: ResortFilter(), size: 1)
    }
}
