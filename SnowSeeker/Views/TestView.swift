//
//  TestView.swift
//  SnowSeeker
//
//  Created by Shane on 01/05/2021.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        VStack {
            ForEach((1...3), id: \.self) {
                Text("\($0)...")
                
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
