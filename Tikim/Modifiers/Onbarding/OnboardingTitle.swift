//
//  Onboarding.swift
//  Tikim
//
//  Created by Rashad on 11.03.26.
//

import SwiftUI

struct OnboardingTitle: ViewModifier {
    var textOffset: CGFloat
    var textOpacity: Double
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .bold()
            .foregroundStyle(.white)
            .minimumScaleFactor(0.6)
            .fixedSize(horizontal: false, vertical: true)
            .offset(y: textOffset)
            .opacity(textOpacity)
            .clipped()
    }
}

extension View {
    func onboardingTitle(offset: CGFloat, opacity: Double) -> some View {
        self.modifier(OnboardingTitle(textOffset: offset, textOpacity: opacity))
    }
}
