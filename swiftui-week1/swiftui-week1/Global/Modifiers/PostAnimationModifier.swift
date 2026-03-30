//
//  PostAnimationModifier.swift
//  swiftui-week1
//
//  Created by mandoo on 3/30/26.
//

import SwiftUI

struct PostImageAnimationModifier: ViewModifier {
    let scale: CGFloat
    let angle: Double
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(scale)
            .animation(.interpolatingSpring(mass: 1, stiffness: 100, damping: 10), value: scale)
            .rotationEffect(.degrees(angle))
            .animation(.bouncy, value: angle)
    }
}
