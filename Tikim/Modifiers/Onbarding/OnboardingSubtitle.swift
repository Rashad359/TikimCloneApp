//
//  OnboardingSubtitle.swift
//  Tikim
//
//  Created by Rashad on 11.03.26.
//

import SwiftUI

struct OnboardingSubtitle: ViewModifier {
    var textOffset: CGFloat
    var textOpacity: Double
    
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundStyle(.white)
            .foregroundStyle(.white)
            .offset(y: textOffset)
            .opacity(textOpacity)
            .clipped()
    }
}

extension View {
    func onboardingSubtitle(offset: CGFloat, opacity: Double) -> some View {
        self.modifier(OnboardingSubtitle(textOffset: offset, textOpacity: opacity))
    }
}
