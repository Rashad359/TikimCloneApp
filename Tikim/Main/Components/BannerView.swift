//

import SwiftUI

struct BannerView: View {
    @Binding var currentID: Int?
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(0..<3, id: \.self) { index in
                        Image(.banner)
                            .resizable()
                            .scaledToFit()
                            .containerRelativeFrame(.horizontal)
                            .clipped()
                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.paging)
            .scrollPosition(id: $currentID)
            .frame(height: 166)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding(.horizontal, 16)
            
            PageController(numberOfPages: 3, currentPage: currentID ?? 0)
        }
    }
}
