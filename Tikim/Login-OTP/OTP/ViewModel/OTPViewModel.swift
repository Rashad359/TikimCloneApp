//

import SwiftUI
internal import Combine

@Observable
class OTPViewModel {
    
    var isCodeValid: Bool = true
    
    var timeRemaining: Int = 10
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var testCode: String = "123456"
}
