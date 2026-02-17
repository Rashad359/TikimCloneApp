//

import SwiftUI

struct PageController: View {
    
    let numberOfPages: Int
    let currentPage: Int
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<numberOfPages, id: \.self) { index in
                Capsule()
                    .fill(index == currentPage ? Color.blue : Color.gray)
                    .frame(width: index == currentPage ? 18 : 6, height: 6)
                    .animation(.easeInOut, value: currentPage)
                    .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    PageController(numberOfPages: 3, currentPage: 1)
}
