//
//  PostView.swift
//  swiftui-week1
//
//  Created by mandoo on 3/16/26.
//

import SwiftUI

struct PostView: View {
    @Environment(AppState.self) private var appState
    @Environment(\.dismiss) private var dismiss
    @State private var isLikeButtonTapped = false
    @State private var isLiked = false
    
    let feed: Feed
    
    var body: some View {
        if let user = appState.currentUser {
            VStack(alignment: .leading, spacing: 10) {
                HStack(spacing: 10) {
                    Image("image")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    Text(user.name)
                        .font(.headline)
                    
                    Spacer()
                    
                    Image(systemName: "ellipsis")
                }
                .padding(.horizontal)
                
                Image(feed.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                
                HStack(spacing: 16) {
                    Button {
                        isLiked.toggle()
                        if isLiked {
                            isLikeButtonTapped = true
                        }
                    } label: {
                        Image(systemName: isLiked ? "heart.fill" : "heart")
                            .foregroundColor(isLiked ? .red : .primary)
                    }
                    Image(systemName: "message")
                }
                .font(.system(size: 24))
                .padding(.horizontal)
                
                Spacer()
            }
            .navigationTitle("\(user.name)의 게시물")
            .alert("조아요", isPresented: $isLikeButtonTapped) {
                Button("넹", role: .cancel) { }
            } message: {
                Text("조아요를 누를까요?")
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Image(systemName: "bookmark")
                }
            }
        }
    }
}
