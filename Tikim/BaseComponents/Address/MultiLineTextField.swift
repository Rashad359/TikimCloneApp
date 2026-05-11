//
//  MultiLineTextField.swift
//  Tikim
//
//  Created by Rashad on 11.05.26.
//

import SwiftUI

struct MultiLineTextField: View {
    var placeholder: String
    @Binding var text: String

    var body: some View {
        TextEditor(text: $text)
            .frame(height: 150)
            .scrollContentBackground(.hidden)
            .padding(5)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white)
                    .stroke(Color.gray, lineWidth: 1)
                    .overlay(alignment: .topLeading) {
                        Text(placeholder)
                            .foregroundStyle(.baseGray)
                            .padding(.horizontal, 9)
                            .padding(.vertical, 13)
                            .opacity(text.isEmpty ? 0.5 : 0)
                            .allowsHitTesting(false)
                    }
            )
//            .padding(.horizontal, 10)
    }
}

#Preview {
    MultiLineTextField(placeholder: "Məsələn: giriş etdikdə liftə daxil olun və 3 cü mərtəbəy qalxın. Mən orada sizi qarşılayacağam", text: .constant(""))
}
