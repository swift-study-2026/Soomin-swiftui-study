//
//  swiftui_week1App.swift
//  swiftui-week1
//
//  Created by mandoo on 3/5/26.
//

import SwiftUI

@main
struct swiftui_week1App: App {
    @State private var user = User()
    
    var body: some Scene {
        WindowGroup {
            AppRootView()
                .environment(user)
        }
    }
}
