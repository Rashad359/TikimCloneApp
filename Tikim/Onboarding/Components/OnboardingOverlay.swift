//

import SwiftUI

struct OnboardingOverlay: View {
    let items: [SlideData]
    let cardWidth: CGFloat
    let binding: Binding<Int?>
    let currentID: Int?
    let textTransition: AnyTransition
    
    var body: some View {
        
        let activeSlide = items[currentID ?? 0]
        
        ZStack {
            
            VStack {
                Spacer()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(items.indices, id: \.self) { index in
                            Image(items[index].imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: cardWidth, height: 375, alignment: .bottom)
                                .clipped()
                                .id(index)
                        }
                    }
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.paging)
                .scrollPosition(id: binding)
                .frame(width: cardWidth)
                .cornerRadius(16)
            }
            
            
            VStack(alignment: .leading, spacing: 14) {
                Text(activeSlide.title)
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.white)
                    .id("title-\(currentID ?? 0)")
                    .transition(textTransition)
                
                Text(activeSlide.subtitle)
                    .font(.headline)
                    .foregroundStyle(.white)
                    .id("subtitle-\(currentID ?? 0)")
                    .transition(textTransition)
            }
            .padding(.horizontal, 14)
            .padding(.top, 14)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
    }
}
