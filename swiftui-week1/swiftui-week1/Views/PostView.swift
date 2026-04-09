//
//  PostView.swift
//  swiftui-week1
//
//  Created by mandoo on 3/16/26.
//

import SwiftUI

struct PostView: View {
    @Environment(AppState.self) private var appState
    @Namespace private var postNamespace
    
    @State private var isLikeButtonTapped = false
    @State private var isLiked = false
    
    @State private var angle = 0.0
    @State private var scale = 1.0
    @State private var showLabel = false
    @State private var isMove = false
    
    let feed: Feed
    
    var body: some View {
        if let user = appState.currentUser {
            VStack(alignment: .leading, spacing: 15) {
                headerView(user: user)
                
                imageSection
                
                buttonsSection
                
                controlsSection
            
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
    
    @ViewBuilder
    private func headerView(user: User) -> some View {
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
    }
    
    private var imageSection: some View {
        ZStack {
            if !isMove {
                Image(feed.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .matchedGeometryEffect(id: "feedImage", in: postNamespace)
                    .postAnimation(scale: scale, angle: angle)
            }
            else {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Image(feed.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 80, height: 80)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .matchedGeometryEffect(id: "feedImage", in: postNamespace)
                            .padding(.trailing, 20)
                    }
                }
            }
            
            if showLabel && !isMove {
                Text("뿅!")
                    .font(.bold16)
                    .foregroundStyle(.blue)
                    .padding()
                    .background(.white)
                    .cornerRadius(10)
                    .transition(.asymmetric(
                        insertion: .scale.combined(with: .move(edge: .bottom)),
                        removal: .opacity.combined(with: .scale(scale: 0.5))
                    ))
            }
        }
        .frame(height: 350)
    }
    
    private var buttonsSection: some View {
        HStack(spacing: 16) {
            Button {
                isLiked.toggle()
                if isLiked { isLikeButtonTapped = true }
            } label: {
                Image(systemName: isLiked ? "heart.fill" : "heart")
                    .foregroundColor(isLiked ? .red : .primary)
            }
            Image(systemName: "message")
        }
        .font(.system(size: 24))
        .padding(.horizontal)
    }
    
    private var controlsSection: some View {
        VStack(spacing: 12) {
            HStack {
                Button("스케일 바꾸기") {
                    withAnimation { scale = (scale == 1.0 ? 1.2 : 1.0) }
                }
                Button("90도 돌리기") {
                    withAnimation { angle += 90 }
                }
            }
            HStack {
                Button("레이블 나타내기") {
                    withAnimation(.snappy) { showLabel.toggle() }
                }
                Button("이동하기") {
                    withAnimation(.spring(response: 0.6, dampingFraction: 0.7)) { isMove.toggle() }
                }
            }
        }
        .buttonStyle(CustomSubButtonStyle())
        .padding(.horizontal)
        .padding(.bottom, 20)
    }
}
