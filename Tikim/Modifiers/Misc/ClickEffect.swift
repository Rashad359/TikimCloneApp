//
//  ClickEffect.swift
//  Tikim
//
//  Created by Rashad on 12.05.26.
//

import SwiftUI

struct ClickEffect: ViewModifier {
    @State private var scale: Double = 1
    var action: (() -> ())?
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(scale)
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.2)) {
                    scale = 0.9
                }
                
                withAnimation(.easeInOut(duration: 0.5)) {
                    scale = 1
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                    action?()
                }
            }
    }
}

extension View {
    func clickEffect(action: (() -> ())?) -> some View {
        modifier(ClickEffect(action: action))
    }
}
