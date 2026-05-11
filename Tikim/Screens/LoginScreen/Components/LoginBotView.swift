//

import SwiftUI

struct LoginBotView: View {
    
//    @Binding var goToMain: Bool
    @AppStorage("logout") var logout = false
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Enter your details to login.")
                .subTextColor()
            
            Text("Continue without logging in.")
                .subTextColor()
                .underline()
                .onTapGesture {
                    logout = false
                }
        }
    }
}

#Preview {
    LoginBotView()
}
