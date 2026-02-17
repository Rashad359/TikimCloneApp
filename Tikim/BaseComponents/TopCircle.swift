//

import SwiftUI

struct TopCircle: View {
    let image: ImageResource
    
    var body: some View {
        Circle()
            .fill(
                LinearGradient(
                    colors: [.gradientBlueTop.opacity(0.1), .gradientBlueBot.opacity(0.2)],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .frame(width: 64, height: 64)
            .overlay(
                Circle()
                    .fill(.white)
                    .frame(width: 40, height: 40, alignment: .center)
                    .overlay(
                        Image(image)
                    )
            )
    }
}

#Preview {
    TopCircle(image: .checkLine)
}
