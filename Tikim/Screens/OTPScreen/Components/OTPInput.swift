//
//  OTPInput.swift
//  Tikim
//
//  Created by Rashad on 11.03.26.
//

import SwiftUI

struct OTPInput: View {
    var model: OTPInputModel
    
    var body: some View {
        VStack {
            if let number = model.number {
                Text(String(number))
            }
        }
        .frame(width: 50, height: 70)
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.grayBorder, lineWidth: 1)
                
                if model.isFocused {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.black.opacity(1), lineWidth: 1)
                        .padding(4)
                }
            }
        )
        .animation(.easeInOut(duration: 0.1), value: model.isFocused)
        
    }
}
