//

import SwiftUI
internal import Combine

struct BannerView: View {
    @Binding var currentID: Int?
    var data: HomeModel.HomeData
    
    @State private var isUserInteracting = false
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
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
            .simultaneousGesture(
                DragGesture()
                    .onChanged{ _ in isUserInteracting = true }
                    .onEnded { _ in
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            isUserInteracting = false
                        }
                    }
            )
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { _ in isUserInteracting = true }
                    .onEnded { _ in
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            isUserInteracting = false
                        }
                    }
            )
            .onReceive(timer) { _ in
                guard !isUserInteracting else { return }
                withAnimation {
                    let count = data.banners.count
                    let next = ((currentID ?? 0) + 1) % count
                    currentID = next
                }
            }
            
            PageController(numberOfPages: data.banners.count, currentPage: currentID ?? 0)
        }
    }
}
