//
//  ProfileField.swift
//  Tikim
//
//  Created by Rashad on 24.04.26.
//

import SwiftUI

struct ProfileField: View {
    
    var title: String
    var leftIcon: String
    @Binding var text: String
    @FocusState var focused: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
            
            HStack {
                Image(leftIcon)
                
                TextField(title, text: $text)
                    .focused($focused)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.strokeSub, lineWidth: 1)
            )
        }
    }
}

#Preview {
    ProfileField(title: "Ad, Soyad", leftIcon: "mail", text: .constant(""))
}
