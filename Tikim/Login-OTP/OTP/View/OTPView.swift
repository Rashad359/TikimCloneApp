//

import SwiftUI

struct OTPView: View {
    @AppStorage("presentMain") private var presentMain: Bool = false
    
    @StateObject private var viewModel = OTPViewModel()
    
    var body: some View {
        CenteredScrollView {
            VStack(spacing: 32) {
                OTPViewTop()
                
                OTPViewBot(
                    isCodeValid: $viewModel.isCodeValid,
                    presentMain: $presentMain,
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
