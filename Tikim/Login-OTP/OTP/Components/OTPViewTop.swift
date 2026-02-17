//

import SwiftUI

struct OTPViewTop: View {
    var body: some View {
        VStack(spacing: 12) {
            TopCircle(image: .checkLine)
            
            VStack(spacing: 4) {
                Text("OTP Code")
                    .fontWeight(.medium)
                    .font(.system(size: 24))
                Text("Enter 6-digit code sent to your number")
                    .foregroundStyle(.textSub)
            }
        }
    }
}
