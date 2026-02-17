//

import SwiftUI

struct PhoneTextField: View {
    
    // Fix text field focus:
    @FocusState var isTextFieldFocused: Bool
    
    @Binding var phoneNumber: String
    
    var strokeColor: Color = .gray.opacity(0.5)
    
    var body: some View {
        HStack(alignment: .center,spacing: 12) {
            
            HStack(spacing: 8) {
                Image(.azerbaijan)
                    .foregroundStyle(.gray)
                
                Text("AZE ")
                    .font(.headline)
                    .foregroundStyle(.black)
            }
            
            HStack(spacing: 4) {
                Text("(+994)")
                
                TextField("00 000 00 00", text: $phoneNumber)
                    .keyboardType(.numberPad)
                    .focused($isTextFieldFocused)
                    .onChange(of: phoneNumber) {
                        if !phoneNumber.isEmpty {
                            phoneNumber = phoneNumber.formatPhoneNumber()
                        }
                        
                        if phoneNumber.count == String.phoneMask.count {
                            print("Dismissing keyboard")
                            isTextFieldFocused = false
                        }
                    }
            }
        }
        .padding(.horizontal, 14)
        .frame(height: 48)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(strokeColor, lineWidth: 1)
        )
    }
}

#Preview {
    PhoneTextField(phoneNumber: .constant("Hello"))
}
