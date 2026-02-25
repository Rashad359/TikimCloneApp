import SwiftUI

struct TestHome: View {
    var body: some View {
        VStack {
            Text("Home")
            
            Spacer()
        }
    }
}

struct SearchView: View {
    var body: some View {
        VStack {
            Text("Search")
            
            Spacer()
        }
    }
}

struct NotificationView: View {
    var body: some View {
        VStack {
            Text("Notifications")
            
            Spacer()
        }
    }
}

struct CartView: View {
    var body: some View {
        VStack {
            Text("Cart")
            
            Spacer()
        }
    }
}

struct TestView: View {
    
    @State private var selectedTab = 0
    
    var body: some View {
        let tabItems = TabItem.allItems
        
        VStack {
            Group {
                switch selectedTab {
                case 0: HomeView()
                case 1: SearchView()
                case 2: NotificationView()
                default: ProfileView()
                }
            }
            
            // Custom tab bar
            CustomTabBar(selectedTab: $selectedTab, tabItems: tabItems)
                .frame(height: 65)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 18))
        }
    }
}

#Preview("Test") {
    TestView()
}
