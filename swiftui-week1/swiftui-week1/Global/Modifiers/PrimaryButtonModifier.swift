//
//  PrimaryButtonModifier.swift
//  swiftui-week1
//
//  Created by mandoo on 3/30/26.
//

import SwiftUI

struct PrimaryButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .padding()
            .font(.bold16)
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(12)
    }
}
