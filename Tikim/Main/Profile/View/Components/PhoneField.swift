//
//  PhoneField.swift
//  Tikim
//
//  Created by Rashad on 24.04.26.
//

import SwiftUI

struct PhoneField: View {
    
    @Binding var phoneNumber: String
    @FocusState var focused: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Mobil nömrə")
                .bold()
            
            HStack {
                HStack {
                    Image("azerbaijan")
                        .frame(width: 20, height: 20)
                    Text("+994")
                }
                
                Divider()
                    .frame(height: 40)
                    .padding(.vertical, -10)
                
                //Phone text field
                TextField("(00) 000-00-00", text: $phoneNumber)
                    .focused($focused)
                    .keyboardType(.numberPad)
                    .onChange(of: phoneNumber) { oldValue, newValue in
                        if !phoneNumber.isEmpty {
                            phoneNumber = phoneNumber.formatPhoneNumber(masks: .profile)
                        }
                    }
            }
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.strokeSub, lineWidth: 1)
            )
        }
    }
}

#Preview {
    PhoneField(phoneNumber: .constant(""))
}
