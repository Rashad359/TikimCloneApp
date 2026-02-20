//

import SwiftUI

struct TestView: View {
    let slides: [SlideData] = [
        SlideData(title: "Lazım olan hər şeyi bir yerdə tap", subtitle: "Axtarma, mağaza gəzmə. Alətlər və materiallar burada cəmlənib.", imageName: "templateImage0", backgroundColor: .baseBlue),
        SlideData(title: "Sən seç, biz gətirək.", subtitle: "Ağırlığı, daşınmanı və kargonu düşünmə — hamısını biz həll edirik", imageName: "templateImage1", backgroundColor: .baseGreen),
        SlideData(title: "Evinə dəyişiklik qat", subtitle: "Daha asan, daha sürətli, daha əlçatan təmir prosesi", imageName: "templateImage2", backgroundColor: .baseOrange)
    ]
    
    var termsText: AttributedString {
        var text = AttributedString("By creating an account, you agree to our Terms of Service and Privacy Policy")
        
        text.foregroundColor = .black
        text.font = .system(size: 12)
        
        if let range = text.range(of: "Terms of Service") {
            text[range].link = URL(string: "https://www.google.com")
            text[range].underlineStyle = .single
            text[range].foregroundColor = .black
        }
        
        if let range = text.range(of: "Privacy Policy") {
            text[range].link = URL(string: "https://www.google.com")
            text[range].underlineStyle = .single
            text[range].foregroundColor = .black
        }
        
        return text
    }
    
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
        
        NavigationStack {
            
            ZStack(alignment: .leading) {
                VStack {
                    Spacer()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 0) {
                            ForEach(slides.indices, id: \.self) { index in
                                Image(slides[index].imageName)
                                    .containerRelativeFrame(.horizontal)
                            }
                        }
                        .scrollTargetLayout()
                    }
                    .scrollTargetBehavior(.paging)
                    .scrollPosition(id: idBinding)
                }
                
                VStack(alignment: .leading, spacing: 14) {
                    Text(slides[currentID ?? 0].title)
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.white)
                        .minimumScaleFactor(0.6)
                        .id("Title-\(currentID ?? 0)")
                        .transition(textTransition)
                    
                    Text(slides[currentID ?? 0].subtitle)
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
            .background(slides[currentID ?? 0].backgroundColor)
            .animation(.easeInOut(duration: animationDuration), value: currentID)
            .padding(.top, 1)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding(.horizontal, 20)
            .navigationDestination(isPresented: $navigateToLogin) {
                LoginView()
            }
            
            PageController(numberOfPages: slides.count, currentPage: currentID ?? 0)
                .padding(.top, 8)
            
            VStack(spacing: 16) {
                BaseButton(text: "Next") {
                    let currentIndex = currentID ?? 0
                    
                    if currentIndex < slides.count - 1 {
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
            }
            .padding(.horizontal, 14)
            .padding(.top, 48)
            .padding(.bottom, 20)
        }
    }
}

#Preview {
    TestView()
}
