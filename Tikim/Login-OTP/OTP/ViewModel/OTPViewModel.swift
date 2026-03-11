//

import SwiftUI
internal import Combine

class OTPViewModel: ObservableObject {
    
    @Published var isCodeValid: Bool = true
    
    @Published var timeRemaining: Int = 10
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var testCode: String = "123456"
}
