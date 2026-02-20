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
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.white)
                    .minimumScaleFactor(0.6)
                    .id("Title-\(currentID ?? 0)")
                    .transition(textTransition)
                
                Text(activeSlide.subtitle)
                    .font(.headline)
                    .foregroundStyle(.white)
                    .foregroundStyle(.white)
                    .id("Subtitle-\(currentID ?? 0)")
                    .transition(textTransition)
                
                Spacer()
            }
            .padding(.top, 14)
            .padding(.horizontal, 14)
            
        }
        .background(activeSlide.backgroundColor)
        .animation(.easeInOut(duration: animationDuration), value: currentID)
        .padding(.top, 1)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .padding(.horizontal, 20)
        .navigationDestination(isPresented: $navigateToLogin) {
            LoginView()
        }
    }
}
