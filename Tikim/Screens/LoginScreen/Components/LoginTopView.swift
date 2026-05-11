//

import SwiftUI

struct LoginTopView: View {
    var body: some View {
        VStack(spacing: 12) {
            TopCircle(image: .userLine)
            
            Text("Login to your account")
                .font(.system(size: 24))
                .fontWeight(.medium)
        }
    }
}
