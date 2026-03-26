//
//  AppRootView.swift
//  swiftui-week1
//
//  Created by mandoo on 3/23/26.
//

import SwiftUI

struct AppRootView: View {
    @Environment(AppState.self) private var appState
    
    var body: some View {
        if appState.isLoggedIn {
            MainView()
        } else {
            LoginView()
        }
    }
}
