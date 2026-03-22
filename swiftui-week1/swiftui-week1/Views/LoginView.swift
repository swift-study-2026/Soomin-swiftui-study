//
//  LoginView.swift
//  swiftui-week1
//
//  Created by mandoo on 3/23/26.
//

import SwiftUI

struct LoginView: View {
    @Environment(User.self) private var user
    
    var body: some View {
        VStack(spacing: 20) {
            Button("로그인") {
                user.isLoggedIn = true
            }
            .buttonStyle(.borderedProminent)
        }
    }
}
