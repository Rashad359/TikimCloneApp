import SwiftUI

struct OnboardingOverlay: View {
    let items: [SlideData]
    @Binding var currentID: Int?
    let animationDuration: CGFloat
    
    @State private var textOffset: CGFloat = 0
    @State private var textOpacity: Double = 1
    @State private var titleText = ""
    @State private var subtitleText = ""
    
    var body: some View {
        
        let activeSlide = items[currentID ?? 0]
        
        ZStack(alignment: .leading) {
            
            RoundedRectangle(cornerRadius: 16)
                .fill(activeSlide.backgroundColor)
                .padding(.horizontal, 20)
            
            VStack {
                Spacer()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(items.indices, id: \.self) { index in
                            Image(items[index].imageName)
                                .scaledToFill()
                                .containerRelativeFrame(.horizontal)
                        }
                    }
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.paging)
                .scrollPosition(id: $currentID)
                .zIndex(100)
            }
            
            VStack(alignment: .leading, spacing: 14) {
                
                Text(titleText == "" ? items[0].title : titleText)
                    .onboardingTitle(offset: textOffset, opacity: textOpacity)
                
                Text(subtitleText == "" ? items[0].subtitle : subtitleText)
                    .onboardingSubtitle(offset: textOffset, opacity: textOpacity)
                
                Spacer()
            }
            .padding(.top, 14)
            .padding(.horizontal, 34)
            
        }
        .onbardingCard(id: currentID ?? 0)
        .onChange(of: currentID ?? 0) { oldValue, newValue in
            // move text to dissappear
            withAnimation(.linear(duration: animationDuration)) {
                textOffset = newValue > oldValue ? -70 : 70
                
            }
            
            // hide text
            DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
                textOffset = newValue > oldValue ? 40 : -40
                textOpacity = 0
                
                titleText = items[newValue].title
                subtitleText = items[newValue].subtitle
                
            }
            
            // move text back into place
            DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration + 0.1) {
                textOpacity = 1
                
                withAnimation(.linear(duration: animationDuration)) {
                    textOffset = 0
                }
            }
        }
    }
}


#Preview {
    OnboardingOverlay(
        items: [
            .init(
                title: "test",
                subtitle: "test",
                imageName: "templateImage0",
                backgroundColor: .blue
            ),
            .init(title: "test2", subtitle: "test2", imageName: "templateImage2", backgroundColor: .red)
        ],
        currentID: .constant(0),
        animationDuration: 4.0
    )
}
