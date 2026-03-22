//
//  AppRootView.swift
//  swiftui-week1
//
//  Created by mandoo on 3/23/26.
//

import SwiftUI

struct AppRootView: View {
    @Environment(User.self) private var user
    
    var body: some View {
        if user.isLoggedIn {
            MainView()
        } else {
            LoginView()
        }
    }
}
