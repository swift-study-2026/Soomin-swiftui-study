//
//  ProfileView.swift
//  swiftui-week1
//
//  Created by mandoo on 3/9/26.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ProfileHeaderView()
            ProfileInfoView()
        }
        .frame(alignment: .leading)
    }
}

struct ProfileHeaderView: View {
    @Environment(AppState.self) private var appState
    
    var body: some View {
        if let user = appState.currentUser {
            HStack(spacing: 20) {
                Image("image")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(.mint.opacity(0.3), lineWidth: 1)
                            .frame(width: 88, height: 88)
                    )
                
                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        Text(user.name)
                            .font(.bold16)
                        Text("she/her")
                            .font(.regular12)
                            .foregroundStyle(.gray)
                    }
                    
                    HStack(spacing: 20) {
                        userInfo(number: "84", name: "posts")
                        userInfo(number: "111", name: "followers")
                        userInfo(number: "232", name: "following")
                    }
                }
            }
        }
    }
    
    private func userInfo(number: String, name: String) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(number)
                .font(.semiBold16)
            Text(name)
                .font(.regular14)
        }
    }
}

struct ProfileInfoView: View {
    @Environment(AppState.self) private var appState
    @State private var isEditButtonTapped: Bool = false
    
    var body: some View {
        if let user = appState.currentUser {
            VStack(alignment: .leading, spacing: 15) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(user.bio)
                }
                .font(.regular14)
                
                HStack(spacing: 10) {
                    Button {
                        isEditButtonTapped = true
                    } label: {
                        Text("Edit Profile")
                    }
                    
                    Button {
                        appState.logout()
                    } label: {
                        Text("Logout")
                    }
                }
                .buttonStyle(CustomSubButtonStyle())
            }
            .sheet(isPresented: $isEditButtonTapped) {
                EditProfileView()
            }
        }
    }
    
    private func profileButton(name: String) -> some View {
        Text(name)
            .font(.semiBold14)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 8)
            .background(Color.gray.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
