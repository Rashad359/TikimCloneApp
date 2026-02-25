//

import SwiftUI

struct OnboardingView: View {
    
    @ObservedObject private var viewModel = OnboardingViewModel()
    
    @State private var currentID: Int? = 0
    
    @State private var isMovingForward = true
    
    @State private var navigateToLogin = false
    
    private var animationDuration: Double = 0.2
    
    var idBinding: Binding<Int?> {
        Binding(
            get: { currentID },
            set: { newValue in
                if let new = newValue, let old = currentID {
                    
                    if new > old {
                        isMovingForward = true
                    } else if new < old {
                        isMovingForward = false
                    }
                }
                
                withAnimation {
                    currentID = newValue
                }
            }
        )
    }
    
    var body: some View {
        
        var textTransition: AnyTransition {
            .asymmetric(
                insertion: .move(edge: isMovingForward ? .bottom : .top).combined(with: .opacity),
                removal: .move(edge: isMovingForward ? .top : .bottom).combined(with: .opacity)
            )
        }
        
        
        OnboardingOverlay(
            navigateToLogin: $navigateToLogin,
            items: viewModel.slides,
            binding: idBinding,
            currentID: currentID,
            textTransition: textTransition,
            animationDuration: animationDuration
        )
        
        PageController(numberOfPages: viewModel.slides.count, currentPage: currentID ?? 0)
            .padding(.top, 8)
        
        BottomView(
            currentID: $currentID,
            isMovingForward: $isMovingForward,
            navigateToLogin: $navigateToLogin,
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
