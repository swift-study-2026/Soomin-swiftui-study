//
//  EditProfileView.swift
//  swiftui-week1
//
//  Created by mandoo on 3/16/26.
//

import SwiftUI

struct EditProfileView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var name: String = "gleamminn"
    @State private var bio: String = "내가 누구게 스유 콩코롱시 스터디..."
    @State private var isPrivate: Bool = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section{
                    TextField("이름", text: $name)
                    TextField("소개", text: $bio)
                }
                Section {
                    Toggle("비공개 할래말래", isOn: $isPrivate)
                }
            }
            .navigationTitle("프로필 편집")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("취소") {
                        dismiss()
                    }
                }
            }
        }
    }
}
