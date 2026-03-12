//

import SwiftUI
internal import Combine


class ProfileViewModel: ObservableObject {
    var accountItems: [ProfileModel.Item] = [
        .init(image: .userLine, title: "About account"),
        .init(image: .markerPin, title: "Adresses"),
        .init(image: .settings, title: "Settings"),
        .init(image: .heart, title: "Favorites")
    ]
    
    var deliveryItems: [ProfileModel.Item] = [
        .init(image: .clock, title: "Order History"),
        .init(image: .markerPin, title: "Addresses")
    ]
    
    var supportItems: [ProfileModel.Item] = [
        .init(image: .phone, title: "Contact Us"),
        .init(image: .information, title: "FAQ"),
        .init(image: .shield, title: "Confidentiality")
    ]
}
