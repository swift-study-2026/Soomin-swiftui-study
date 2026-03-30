//
//  View+.swift
//  swiftui-week1
//
//  Created by mandoo on 3/30/26.
//

import SwiftUI

extension View {
    func primaryButtonStyle() -> some View {
        self.modifier(PrimaryButtonModifier())
    }
    
    func textFieldStyle() -> some View {
        self.modifier(TextFieldModifier())
    }
    
    func postAnimation(scale: CGFloat, angle: Double) -> some View {
        self.modifier(PostImageAnimationModifier(scale: scale, angle: angle))
    }
}
