//

import SwiftUI

struct LoginView: View {
    
    @State private var phoneNumber: String = ""
    
    @State private var presentLogin: Bool = false
    
    @State private var isNumberValid: Bool = true
    
    @AppStorage("logout") private var logout = false
    
    @ObservedObject private var viewModel = LoginViewModel()
    
    var body: some View {
            CenteredScrollView {
                VStack(spacing: 32) {
                    
                    LoginTopView()
                    
                    LoginMidView(
                        phoneNumber: $phoneNumber,
                        isNumberValid: $isNumberValid,
                        presentLogin: $presentLogin,
                        phoneNumLabel: viewModel.phoneNumLabel,
                        testNumber: viewModel.testNumber
                    )
                    
                    LoginBotView()
                }
                .padding(.horizontal, 24)
            }
            .withCustomBackButton(show: !logout)
            .navigationDestination(isPresented: $presentLogin) {
                OTPView()
            }
    }
}

#Preview {
    LoginView()
}
