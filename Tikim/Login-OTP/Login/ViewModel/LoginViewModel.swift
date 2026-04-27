//

import SwiftUI

@Observable
class LoginViewModel {
    
    var phoneNumber: String = ""
    
    var presentLogin: Bool = false
    
    var isNumberValid: Bool = true
    
    var testNumber: String = "507437588"
    
    @ObservationIgnored
    @AppStorage("logout") var logout = false
    
    var phoneNumLabel: AttributedString {
        var text = AttributedString("Phone number *")
        
        if let range = text.range(of: "*") {
            text[range].foregroundColor = .gradientBlueTop
        }
        
        return text
    }
}
