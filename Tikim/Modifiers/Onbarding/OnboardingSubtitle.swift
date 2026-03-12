//
//  OnboardingSubtitle.swift
//  Tikim
//
//  Created by Rashad on 11.03.26.
//

import SwiftUI

struct OnboardingSubtitle: ViewModifier {
    var currentID: Int?
    var textTransition: AnyTransition
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundStyle(.white)
            .id("Subtitle-\(currentID ?? 0)")
            .transition(textTransition)
    }
}

extension View {
    func onboardingSubtitle(id: Int?, transition: AnyTransition) -> some View {
        self.modifier(OnboardingSubtitle(currentID: id, textTransition: transition))
    }
}
