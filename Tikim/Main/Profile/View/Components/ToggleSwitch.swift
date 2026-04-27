//
//  ToggleSwitch.swift
//  Tikim
//
//  Created by Rashad on 24.04.26.
//

import SwiftUI

struct ToggleSwitch: View {
    
    @Binding var toggle: Bool
    
    var body: some View {
        Capsule()
            .fill(toggle ? Color.baseBlue : Color.black.opacity(0.15))
            .frame(width: 28, height: 16)
            .overlay(alignment: toggle ? .trailing : .leading) {
                Circle()
                    .fill(Color.white)
                    .frame(width: 12, height: 12)
                    .padding(.horizontal, 2)
                    .overlay(
                        Circle()
                            .fill(toggle ? Color.baseBlue : Color.white)
                            .frame(width: 4, height: 4)
                    )
            }
            .onTapGesture {
                withAnimation {
                    toggle.toggle()
                }
            }
    }
}

#Preview {
    ToggleSwitch(toggle: .constant(false))
}
