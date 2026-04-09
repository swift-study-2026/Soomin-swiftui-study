//
//  CustomSubButton.swift
//  swiftui-week1
//
//  Created by mandoo on 3/30/26.
//

import SwiftUI

struct CustomSubButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.semiBold14)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 8)
            .background(configuration.isPressed ? .blue.opacity(0.4) : .gray.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
    }
}
