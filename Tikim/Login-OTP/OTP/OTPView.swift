//

import SwiftUI

struct OTPView: View {
    @State private var code: String = ""
    
    @State private var isCodeValid: Bool = true
    
    @State private var presentMain: Bool = false
    
    @State private var timeRemaining: Int = 10
    
    @ObservedObject private var viewModel = OTPViewModel()
    
    var body: some View {
        VStack(spacing: 32) {
            OTPViewTop()
            
            OTPViewBot(
                code: $code,
                isCodeValid: $isCodeValid,
                presentMain: $presentMain,
                timeRemaining: $timeRemaining,
                testCode: viewModel.testCode
            )
        }
        .padding(.horizontal, 24)
        .withCustomBackButton()
        .navigationDestination(isPresented: $presentMain) {
            MainView()
                .navigationBarBackButtonHidden(true)
        }
        .onReceive(viewModel.timer) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            }
        }
    }
}


#Preview {
    OTPView()
}
