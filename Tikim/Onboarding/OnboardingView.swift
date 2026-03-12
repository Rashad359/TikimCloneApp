//

import SwiftUI

struct OnboardingView: View {
    
    @State private var viewModel = OnboardingViewModel()
    
    private var animationDuration: Double = 0.2
    
    var body: some View {
        
        OnboardingOverlay(
            navigateToLogin: $viewModel.navigateToLogin,
            items: viewModel.slides,
            currentID: $viewModel.currentID,
            animationDuration: animationDuration
        )
        
        PageController(numberOfPages: viewModel.slides.count, currentPage: viewModel.currentID ?? 0)
            .padding(.top, 8)
        
        BottomView(
            currentID: $viewModel.currentID,
            isMovingForward: $viewModel.isMovingForward,
            navigateToLogin: $viewModel.navigateToLogin,
            items: viewModel.slides,
            termsText: viewModel.termsText,
            animationDuration: animationDuration
        )
        .padding(.horizontal, 14)
        .padding(.top, 48)
        .padding(.bottom, 20)
    }
}

#Preview {
    OnboardingView()
}
