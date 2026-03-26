//
//  AppState.swift
//  swiftui-week1
//
//  Created by mandoo on 3/26/26.
//

import SwiftUI
import Observation

@Observable
class AppState {
    var currentUser: User?
    var isLoggedIn: Bool = false
    
    func login(user: User) {
        self.currentUser = user
        self.isLoggedIn = true
    }
    
    func logout() {
        self.currentUser = nil
        self.isLoggedIn = false
    }
}
