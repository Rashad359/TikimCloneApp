//

import SwiftUI

struct OnboardingOverlay: View {
    @Binding var navigateToLogin: Bool
    let items: [SlideData]
    let binding: Binding<Int?>
    var currentID: Int?
    let textTransition: AnyTransition
    let animationDuration: CGFloat
    
    var body: some View {
        
        let activeSlide = items[currentID ?? 0]
        
        ZStack(alignment: .leading) {
            VStack {
                Spacer()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(items.indices, id: \.self) { index in
                            Image(items[index].imageName)
                                .containerRelativeFrame(.horizontal)
                        }
                    }
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.paging)
                .scrollPosition(id: binding)
            }
            
            VStack(alignment: .leading, spacing: 14) {
                Text(activeSlide.title)
                    .onboardingTitle(id: currentID ?? 0, transition: textTransition)
                
                Text(activeSlide.subtitle)
                    .onboardingSubtitle(id: currentID ?? 0, transition: textTransition)
                
                Spacer()
            }
            .padding(.top, 14)
            .padding(.horizontal, 14)
            
        }
        .onbardingCard(backColor: activeSlide.backgroundColor, animDuration: animationDuration, id: currentID ?? 0)
        .navigationDestination(isPresented: $navigateToLogin) {
            LoginView()
        }
    }
}
