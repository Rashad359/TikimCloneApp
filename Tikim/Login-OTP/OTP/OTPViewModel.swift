//

import SwiftUI
internal import Combine

class OTPViewModel: ObservableObject {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var testCode: String = "123456"
}
