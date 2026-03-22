//
//  MainView.swift
//  swiftui-week1
//
//  Created by mandoo on 3/5/26.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    ProfileView()
                    Divider()
                    FeedView()
                }
                .padding(.horizontal, 16)
            }
            .navigationDestination(for: Feed.self) { selectedFeed in
                PostView(feed: selectedFeed)
            }
        }
    }
}
