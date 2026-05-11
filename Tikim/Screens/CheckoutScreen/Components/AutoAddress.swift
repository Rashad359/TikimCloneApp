//
//  AutoAddress.swift
//  Tikim
//
//  Created by Rashad on 11.05.26.
//

import SwiftUI
import MapKit

struct AutoAddress: View {
    @Binding var isAnimating: Bool
    @Binding var showMessage: Bool
    @Binding var addresses: [LocationModel]
    var latitude: CGFloat
    var longitude: CGFloat
    
    func dismissMessage() {
        withAnimation(.easeInOut(duration: 1)) {
            isAnimating = false
        } completion: {
            showMessage = false
        }
    }
    
    var body: some View {
        ZStack {
            
            Color.black
                .ignoresSafeArea()
                .opacity(isAnimating ? 0.6 : 0)
                .animation(.easeInOut(duration: 0.3), value: isAnimating)
            
            if isAnimating {
                VStack(spacing: 24) {
                    VStack(spacing: 10) {
                        Text("43 Cəfər Cabbarlı küçəsi, Bakı 1065, Azərbaycan")
                            .bold()
                            .font(.system(size: 22))
                            .multilineTextAlignment(.center)
                        
                        Text("Telefonunuzun konumuna görə burda olduğunuz görsənir")
                            .foregroundStyle(Color.subTextGray)
                            .multilineTextAlignment(.center)
                    }
                    
                    VStack(spacing: 12) {
                        BaseButton(text: "Bu adresi istifadə et") {
                            addresses.append(.init(title: "Current location", isSelected: true, category: .home, latitude: latitude, longitude: longitude))
                            
                            dismissMessage()
                        }
                        
                        BaseButton(
                            text: "Başqa adres üçün sifariş edəcəm",
                            textColor: .black,
                            backgroundColor: .white,
                            strokeColor: .gray,
                            lineWidth: 1
                        ) {
                            dismissMessage()
                        }
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

//#Preview {
//    AutoAddress(isAnimating: .constant(true), showMessage: .constant(true), addresses: .constant([.init(title: "ldskfjs", isSelected: false, category: .home, latitude: 20.000, longitude: 20.000)]))
//}
