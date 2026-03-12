//
//  Onboarding.swift
//  Tikim
//
//  Created by Rashad on 11.03.26.
//

import SwiftUI

struct OnboardingTitle: ViewModifier {
    var currentID: Int?
    var textTransition: AnyTransition
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .bold()
            .foregroundStyle(.white)
            .minimumScaleFactor(0.6)
            .id("Title-\(currentID ?? 0)")
            .transition(textTransition)
    }
}

extension View {
    func onboardingTitle(id: Int?, transition: AnyTransition) -> some View {
        self.modifier(OnboardingTitle(currentID: id, textTransition: transition))
    }
}
