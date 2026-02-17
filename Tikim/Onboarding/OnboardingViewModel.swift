//

import SwiftUI
internal import Combine

class OnboardingViewModel: ObservableObject {
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
}
