//
//  OnboardingCard.swift
//  Tikim
//
//  Created by Rashad on 11.03.26.
//

import SwiftUI

struct OnboardingCard: ViewModifier {
    var currentID: Int
    
    func body(content: Content) -> some View {
        content
            .background(Color.clear)
            .animation(.easeInOut, value: currentID)
            .padding(.top, 1)
    }
}

extension View {
    func onbardingCard(id: Int) -> some View {
        self.modifier(OnboardingCard(currentID: id))
    }
}
