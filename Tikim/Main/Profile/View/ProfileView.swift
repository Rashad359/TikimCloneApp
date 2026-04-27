//

import SwiftUI

struct ProfileView: View {
    
    @State private var viewModel = ProfileViewModel()
    
    @AppStorage("presentMain") var userLoggedIn = false
    
    @State private var showMessage: Bool = false
    
    @State private var showLogOutAlert: Bool = false
    
    @AppStorage("logout") private var logout = false
    
    
    
    var body: some View {
        ZStack {
            List {
                Section(header: Text("Manage Account")) {
                    ForEach(0..<viewModel.accountItems.count, id: \.self) { index in
                        ListRow(item: viewModel.accountItems[index], textColor: .black) {
                            switch index {
                            case 0:
                                print("go to user info")
                                viewModel.navigation = .profile
                            case 1:
                                print("go to addresses")
                            case 2:
                                print("go to settings")
                                viewModel.navigation = .settings
                            case 3:
                                print("go to favorites")
                            default:
                                fatalError("Something went wrong in account items")
                            }
                        }
                    }
                }
                
                Section(header: Text("Delivery")) {
                    ForEach(0..<viewModel.deliveryItems.count, id: \.self) { index in
                        ListRow(item: viewModel.deliveryItems[index], textColor: .black) {
                            switch index {
                            case 0:
                                print("go to history")
                            case 1:
                                print("go to delivery addresses")
                            default:
                                fatalError("Something went wrong in delivery items")
                            }
                        }
                    }
                }
                
                Section(header: Text("Settings")) {
                    ForEach(0..<viewModel.supportItems.count, id: \.self) { index in
                        ListRow(item: viewModel.supportItems[index], textColor: .black) {
                            switch index {
                            case 0:
                                print("go to contacts")
                            case 1:
                                print("go to FAQ")
                            case 2:
                                print("go to privacy")
                            default:
                                fatalError("Something went wrong in support items")
                            }
                        }
                    }
                }
                
                if userLoggedIn {
                    Section() {
                        ListRow(item: .init(image: .logOut, title: "Çıxış et"), textColor: .red) {
                            showLogOutAlert = true
                        }
                        .alert("Are you sure you want to log out?", isPresented: $showLogOutAlert, actions: {
                            
                            //Cancel action
                            Button(role: .cancel) {
                                // Cancel alert
                            } label: {
                                Text("Cancel")
                            }
                            
                            // Log out
                            Button(role: .destructive) {
                                logout = false
                                userLoggedIn = false
                                withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                                    showMessage = true
                                }
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    withAnimation(.easeIn(duration: 1)) {
                                        showMessage = false
                                    }
                                }
                            } label: {
                                Text("Log out")
                            }
                        })
                        .listRowBackground(Color.categoryRed)
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(item: $viewModel.navigation) { item in
                switch item {
                case .profile:
                    EditAccountView()
                case .settings:
                    SettingsView()
                }
            }
            
            
            if showMessage {
                NotificationView()
                    .transition(
                        .asymmetric(
                            insertion: .move(edge: .top),
                            removal: .move(edge: .top)
                        )
                    )
                    .zIndex(2)
            }
        }
    }
}

#Preview {
    ProfileView()
}

enum ProfileNavigationPaths {
    case profile
    case settings
}
