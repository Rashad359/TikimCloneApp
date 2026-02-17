//

import SwiftUI

struct LoginMidView: View {
    @Binding var phoneNumber: String
    @Binding var isNumberValid: Bool
    @Binding var presentLogin: Bool
    let phoneNumLabel: AttributedString
    let testNumber: String
    
    var body: some View {
        
        VStack(spacing: 24) {
            
            VStack(alignment: .leading, spacing: 6) {
                Text(phoneNumLabel)
                
                PhoneTextField(phoneNumber: $phoneNumber, strokeColor: isNumberValid ? .gray.opacity(0.5) : .red)
                    .onChange(of: phoneNumber) {
                        isNumberValid = true
                    }
                
                HStack(spacing: 4) {
                    Image(.warningIcon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 16)
                    
                    Text("Nömrə düzgün qeyd olunmayıb")
                        .foregroundStyle(.red)
                }
                .opacity(isNumberValid ? 0 : 1)
            }
            
            BaseButton(
                text: "Continue",
                isDisabled: !isNumberValid,
                textColor: isNumberValid ? .white : .foregroundDisabled,
                backgroundColor: isNumberValid ? .baseBlue : .backgroundDisabled
            ) {
                if phoneNumber == testNumber {
                    isNumberValid = true
                    presentLogin = true
                } else {
                    isNumberValid = false
                }
            }
        }
    }
}
