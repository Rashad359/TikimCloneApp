//

import SwiftUI
internal import Combine

class LoginViewModel: ObservableObject {
    var testNumber: String = "50 743 75 88"
    
    var phoneNumLabel: AttributedString {
        var text = AttributedString("Phone number *")
        
        if let range = text.range(of: "*") {
            text[range].foregroundColor = .gradientBlueTop
        }
        
        return text
    }
}
