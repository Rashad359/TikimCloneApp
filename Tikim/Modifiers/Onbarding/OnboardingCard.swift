//
//  OnboardingCard.swift
//  Tikim
//
//  Created by Rashad on 11.03.26.
//

import SwiftUI

struct OnboardingCard: ViewModifier {
    var backgroundColor: Color
    var animationDuration: CGFloat
    var currentID: Int
    
    func body(content: Content) -> some View {
        content
            .background(backgroundColor)
            .animation(.easeInOut(duration: animationDuration), value: currentID)
            .padding(.top, 1)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding(.horizontal, 20)
    }
}

extension View {
    func onbardingCard(backColor: Color, animDuration: CGFloat, id: Int) -> some View {
        self.modifier(OnboardingCard(backgroundColor: backColor, animationDuration: animDuration, currentID: id))
    }
}
