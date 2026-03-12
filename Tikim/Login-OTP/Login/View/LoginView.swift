//

import SwiftUI

struct LoginView: View {
    
    @AppStorage("logout") private var logout = false
    
    @State private var viewModel = LoginViewModel()
    
    var body: some View {
            CenteredScrollView {
                VStack(spacing: 32) {
                    
                    LoginTopView()
                    
                    LoginMidView(
                        phoneNumber: $viewModel.phoneNumber,
                        isNumberValid: $viewModel.isNumberValid,
                        presentLogin: $viewModel.presentLogin,
                        phoneNumLabel: viewModel.phoneNumLabel,
                        testNumber: viewModel.testNumber
                    )
                    
                    LoginBotView()
                }
                .padding(.horizontal, 24)
            }
            .withCustomBackButton(show: !logout)
            .navigationDestination(isPresented: $viewModel.presentLogin) {
                OTPView()
            }
    }
}

#Preview {
    LoginView()
}
