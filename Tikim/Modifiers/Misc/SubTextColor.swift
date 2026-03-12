//
//  SubTextColor.swift
//  Tikim
//
//  Created by Rashad on 11.03.26.
//

import SwiftUI

struct SubTextColor: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.textSub)
        
    }
}

extension View {
    func subTextColor() -> some View {
        self.modifier(SubTextColor())
    }
}
