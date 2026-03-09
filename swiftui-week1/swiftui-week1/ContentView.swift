//
//  ContentView.swift
//  swiftui-week1
//
//  Created by mandoo on 3/5/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                ProfileView()
                
                Divider()
                
                FeedView()
            }
            .padding(.horizontal, 16)
        }
        .safeAreaInset(edge: .top) {
            Color.white
                .frame(height: 0)
                .background(Color.white)
        }
    }
}
