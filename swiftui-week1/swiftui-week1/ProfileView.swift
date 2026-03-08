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
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ProfileHeaderView: View {
    var body: some View {
        HStack(spacing: 20) {
            Image("image")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .background(
                    Circle()
                        .stroke(.mint.opacity(0.3), lineWidth: 1)
                        .frame(width: 88, height: 88)
                )
            
            VStack(alignment: .leading, spacing: 15) {
                HStack {
                    Text("gleamminn").font(.bold16)
                    Text("she/her").font(.regular12).foregroundStyle(.gray)
                }
                
                HStack(spacing: 20) {
                    userInfo(number: "84", name: "posts")
                    userInfo(number: "111", name: "followers")
                    userInfo(number: "232", name: "following")
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
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            VStack(alignment: .leading, spacing: 4) {
                Text("내가 누구게")
                Text("스유 콩코롱시 스터디 매주 월요일...")
            }
            .font(.regular14)
            
            HStack(spacing: 10) {
                profileButton(name: "Edit profile")
                profileButton(name: "Share profile")
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
