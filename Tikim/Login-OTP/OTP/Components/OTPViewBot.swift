//

import SwiftUI

struct OTPViewBot: View {
    @Binding var code: String
    @Binding var isCodeValid: Bool
    @Binding var presentMain: Bool
    @Binding var timeRemaining: Int
    let testCode: String
    
    var body: some View {
        VStack(spacing: 24) {
            OTPInput(
                text: $code,
                digitCount: 6,
                numericOnly: true,
                borderColor: isCodeValid ? .strokeSoft : .red
            )
            .onChange(of: code) {
                isCodeValid = true
            }
            
            
            BaseButton(
                text: "Login",
                isDisabled: !isCodeValid,
                textColor: isCodeValid ? .white : .foregroundDisabled,
                backgroundColor: isCodeValid ? .baseBlue : .backgroundDisabled
            ) {
                
                if code == testCode {
                    //log in
                    isCodeValid = true
                    presentMain = true
                } else {
                    //code is wrong
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

