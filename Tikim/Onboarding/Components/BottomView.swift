//

import SwiftUI

struct BottomView: View {
    @Binding var currentID: Int?
    @Binding var isMovingForward: Bool
    @Binding var navigateToLogin: Bool
    let items: [SlideData]
    let termsText: AttributedString
    let animationDuration: Double
    
    var body: some View {
        VStack(spacing: 16) {
            BaseButton(text: "Next") {
                let currentIndex = currentID ?? 0
                
                if currentIndex < items.count - 1 {
                    isMovingForward = true
                    withAnimation(.easeInOut(duration: animationDuration)) {
                        currentID = currentIndex + 1
                    }
                } else {
                    navigateToLogin = true
                }
            }
            
            BaseButton(text: "Skip", textColor: .black, backgroundColor: .white, strokeColor: .gray, lineWidth: 1) {
                navigateToLogin = true
            }
            
            Text(termsText)
                .font(.system(size: 12))
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
        }    }
}
