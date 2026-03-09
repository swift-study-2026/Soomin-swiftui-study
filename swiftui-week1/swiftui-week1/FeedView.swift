//
//  FeedView.swift
//  swiftui-week1
//
//  Created by mandoo on 3/9/26.
//

import SwiftUI

struct Feed: Identifiable {
    let id: UUID = UUID()
    let image: ImageResource
}

struct FeedView: View {
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5)
    ]
    
    let feeds: [Feed] = [
        Feed(image: .feed1),
        Feed(image: .feed2),
        Feed(image: .feed3),
        Feed(image: .feed4),
        Feed(image: .feed5),
        Feed(image: .feed6),
        Feed(image: .feed7),
        Feed(image: .feed8),
        Feed(image: .feed9),
        Feed(image: .feed10),
        Feed(image: .feed11),
        Feed(image: .feed12),
        Feed(image: .feed13),
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 5) {
            ForEach(feeds) { feed in
                Image(feed.image)
                    .resizable()
                    .aspectRatio(1, contentMode: .fill)
            }
        }
    }
}
