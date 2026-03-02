//

import SwiftUI

struct BannerView: View {
    @Binding var currentID: Int?
    var data: HomeModel.HomeData
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(0..<data.banners.count, id: \.self) { index in
                        Image(data.banners[index])
                            .resizable()
                            .scaledToFill()
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
