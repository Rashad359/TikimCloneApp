//

import SwiftUI

struct OTPView: View {
    
    @State private var viewModel = OTPViewModel()
    
    var body: some View {
        CenteredScrollView {
            VStack(spacing: 32) {
                OTPViewTop()
                
                OTPViewBot(
                    isCodeValid: $viewModel.isCodeValid,
                    userLoggedIn: $viewModel.userLoggedIn,
                    logout: $viewModel.logout,
                    timeRemaining: $viewModel.timeRemaining,
                    testCode: viewModel.testCode
                )
            }
            .padding(.horizontal, 24)
        }
        .withCustomBackButton(show: true)
        .onReceive(viewModel.timer) { _ in
            if viewModel.timeRemaining > 0 {
                viewModel.timeRemaining -= 1
            }
        }
    }
}


#Preview {
    OTPView()
}
