//
//  DestinationForm.swift
//  Tikim
//
//  Created by Rashad on 09.05.26.
//

import SwiftUI

struct DestinationInfo: View {
    var title: String
    var placeholder: String
    @Binding var text: String
    var isMultiLine: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
            
            if isMultiLine {
                MultiLineTextField(placeholder: placeholder, text: $text)
            } else {
                TextField(placeholder, text: $text)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 14)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white)
                            .stroke(Color.gray, lineWidth: 1)
                    )
            }   
        }
    }
}

#Preview {
    DestinationInfo(title: "Test", placeholder: "Test placeholder", text: .constant(""))
}
