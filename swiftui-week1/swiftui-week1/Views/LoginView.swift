//
//  LoginView.swift
//  swiftui-week1
//
//  Created by mandoo on 3/23/26.
//

import SwiftUI

struct LoginView: View {
    @Environment(AppState.self) private var appState
    @State private var id: String = ""
    @State private var bio: String = ""
    
    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 15) {
                TextField("아이디", text: $id)
                TextField("자기소개", text: $bio)
            }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal, 20)
            
            Button("로그인") {
                let user = User(name: id, bio: bio)
                appState.login(user: user)
            }
            .buttonStyle(.borderedProminent)
        }
    }
}
