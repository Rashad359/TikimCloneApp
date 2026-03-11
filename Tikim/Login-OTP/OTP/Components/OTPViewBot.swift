//

import SwiftUI

struct OTPViewBot: View {
    @State var inputModel: [OTPInputModel] = [
        .init(number: nil, isFocused: false),
        .init(number: nil, isFocused: false),
        .init(number: nil, isFocused: false),
        .init(number: nil, isFocused: false),
        .init(number: nil, isFocused: false),
        .init(number: nil, isFocused: false)
    ]
    @Binding var isCodeValid: Bool
    @Binding var presentMain: Bool
    @Binding var timeRemaining: Int
    let testCode: String
    
    var body: some View {
        VStack(spacing: 24) {
            OTPInputView(inputModel: $inputModel)
                .onChange(of: inputModel) { _, _ in
                    isCodeValid = true
                }
            
            
            BaseButton(
                text: "Login",
                isDisabled: !isCodeValid,
                textColor: isCodeValid ? .white : .foregroundDisabled,
                backgroundColor: isCodeValid ? .baseBlue : .backgroundDisabled
            ) {
                
                var finalValue: String = ""
                
                inputModel.forEach { finalValue += String($0.number ?? "X") }
                
                if finalValue == testCode {
                    isCodeValid = true
                    presentMain = true
                } else {
                    isCodeValid = false
                }
            }
            
            VStack(spacing: 4) {
                Text("OTP-kod yanlışdı")
                    .foregroundStyle(.red)
                    .opacity(isCodeValid ? 0 : 1)
                
                Text("Experiencing issues receiving the code?")
                    .foregroundStyle(.textSub)
                
                Button {
                    if timeRemaining == 0 {
                        timeRemaining = 10
                    }
                } label: {
                    Text(timeRemaining > 0 ? "Resend Code \(timeRemaining)" : "Resend Code")
                        .underline()
                        .font(.system(size: 14))
                        .foregroundStyle(timeRemaining > 0 ? .textSub : .baseBlue)
                }
                .disabled(timeRemaining > 0)
            }
        }
    }
}

