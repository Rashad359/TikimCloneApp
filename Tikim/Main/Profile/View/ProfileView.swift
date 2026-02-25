//

import SwiftUI

struct ProfileView: View {
    @AppStorage("presentMain") private var presentLogin = true
    
    @AppStorage("logout") private var logout = false
    
    @ObservedObject private var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Manage Account")) {
                    ForEach(0..<viewModel.accountItems.count, id: \.self) { index in
                        ListRow(item: viewModel.accountItems[index], textColor: .black) {
                            switch index {
                            case 0:
                                print("go to user info")
                            case 1:
                                print("go to addresses")
                            case 2:
                                print("go to settings")
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
                
                Section() {
                    ListRow(item: .init(image: .logOut, title: "Çıxış et"), textColor: .red) {
                        presentLogin = false
                        logout = true
                    }
                    .listRowBackground(Color.categoryRed)
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ProfileView()
}
