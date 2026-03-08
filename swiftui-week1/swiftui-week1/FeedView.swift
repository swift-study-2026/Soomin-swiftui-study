//
//  FeedView.swift
//  swiftui-week1
//
//  Created by mandoo on 3/9/26.
//

import SwiftUI

struct FeedView: View {
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5)
    ]
    
    let imageNames: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13"]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 5) {
            ForEach(imageNames, id: \.self) { imageName in
                Image(imageName)
                    .resizable()
                    .aspectRatio(1, contentMode: .fill)
            }
        }
    }
}
