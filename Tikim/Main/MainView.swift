//

import SwiftUI

struct MainView: View {
    @State private var selectedTab: Int = 0
    
    var body: some View {
        let tabItems = TabItem.allItems

        VStack {
            Group {
                switch selectedTab {
                case 0: HomeView()
                case 1: SearchView()
                case 2: NotificationView()
                case 3: CartView()
                default: ProfileView()
                }
            }
            
            CustomTabBar(selectedTab: $selectedTab, tabItems: tabItems)
                .frame(height: 65)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 18))
        }
    }
}

#Preview {
    MainView()
}


struct TabItem {
    let title: String
    let icon: String
    
    static let allItems: [TabItem] = [
        TabItem(title: "Home", icon: "homeIcon"),
        TabItem(title: "Search", icon: "searchIcon"),
        TabItem(title: "Stores", icon: "storeIcon"),
        TabItem(title: "Cart", icon: "cartIcon"),
        TabItem(title: "Profile", icon: "userIcon"),
    ]
}


struct NotificationView: View {
    var body: some View {
        Text("Notification View")
        
        Spacer()
    }
}

struct CartView: View {
    var body: some View {
        Text("Cart View")
        
        Spacer()
    }
}
