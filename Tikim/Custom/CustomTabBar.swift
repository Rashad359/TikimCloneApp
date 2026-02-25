//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Int
    let tabItems: [TabItem]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 18)
                .fill(Color.white)
                .shadow(color: Color.gray.opacity(0.2), radius: 8, x: 0, y: -2)
            
            HStack(spacing: 0) {
                ForEach(0..<tabItems.count, id:\.self) { index in
                    Button {
                        withAnimation(.easeInOut(duration: 0.1)) {
                            selectedTab = index
                        }
                    } label: {
                        VStack {
                            Image(tabItems[index].icon)
                                .renderingMode(.template)
                                .font(.system(size: 24))
                                .foregroundStyle(selectedTab == index ? .baseBlue : .gray)
                            
                            Text(tabItems[index].title)
                                .font(.caption)
                                .foregroundStyle(selectedTab == index ? .baseBlue : .gray)
                        }
                        .frame(maxWidth: .infinity)
                            .padding(.top, 10)
                    }
                }
            }
            
            GeometryReader { geo in
                let tabWidth = geo.size.width / CGFloat(tabItems.count)
                let indicatorWidth: CGFloat = 40
                let indicatorOffset = (tabWidth * CGFloat(selectedTab)) + (tabWidth - indicatorWidth) / 2
                
                Color.baseBlue
                    .frame(width: indicatorWidth + 10, height: 4)
                    .clipShape(RoundedRectangle(cornerRadius: 2))
                    .offset(x: indicatorOffset - 5)
                    .animation(.easeInOut(duration: 0.3), value: selectedTab)
            }
        }
        .frame(height: 65)
    }
}

#Preview {
    CustomTabBar(selectedTab: .constant(1), tabItems: [.init(title: "Home", icon: "house")])
}
