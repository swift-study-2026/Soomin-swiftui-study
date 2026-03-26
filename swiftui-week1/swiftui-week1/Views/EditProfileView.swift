//
//  EditProfileView.swift
//  swiftui-week1
//
//  Created by mandoo on 3/16/26.
//

import SwiftUI

struct EditProfileView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(AppState.self) private var appState
    
    var body: some View {
        if let user = appState.currentUser {
            @Bindable var user = user
            
            NavigationStack {
                Form {
                    Section{
                        TextField("이름", text: $user.name)
                        TextField("소개", text: $user.bio)
                    }
                    Section {
                        Toggle("비공개 할래말래", isOn: $user.isPrivate)
                    }
                }
                .navigationTitle("프로필 편집")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("확인") {
                            dismiss()
                        }
                    }
                }
            }
        }
    }
}
