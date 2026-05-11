//
//  ConfirmationView.swift
//  Tikim
//
//  Created by Rashad on 22.04.26.
//

import SwiftUI

struct ConfirmationView: View {
    
    var isAnimating: Bool
    
    var body: some View {
        ZStack {
            
            Color.black
                .ignoresSafeArea()
                .opacity(isAnimating ? 0.6 : 0)
                .animation(.easeInOut(duration: 0.3), value: isAnimating)
            
            if isAnimating {
                VStack(spacing: 16) {
                    Image("approvedIcon")
                    
                    VStack(spacing: 4) {
                        Text("Səbətə əlavə olundu")
                            .bold()
                            .font(.system(size: 22))
                        
                        Text("detalları səbət bölməsindən görə bilərsiniz")
                            .foregroundStyle(Color.subTextGray)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 24)
                .padding(.horizontal, 16)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white)
                )
                .padding(.horizontal, 16)
                .transition(
                    .asymmetric(
                        insertion: .move(edge: .bottom).combined(with: .opacity),
                        removal: .move(edge: .bottom).combined(with: .opacity)
                    )
                )
                .zIndex(2)
            }
        }
    }
}

#Preview {
    ConfirmationView(isAnimating: true)
}
