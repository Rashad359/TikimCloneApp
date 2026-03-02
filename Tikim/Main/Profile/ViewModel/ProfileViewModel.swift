//

import SwiftUI
internal import Combine

class ProfileViewModel: ObservableObject {
    var accountItems: [ProfileModel.Item] = [
        .init(image: .userLine, title: "About account"),
        .init(image: .markerPin, title: "Adreslərim"),
        .init(image: .settings, title: "Parametrlər"),
        .init(image: .heart, title: "Favorilər")
    ]
    
    var deliveryItems: [ProfileModel.Item] = [
        .init(image: .clock, title: "Sifariş tarixçəsi"),
        .init(image: .markerPin, title: "Adreslərim")
    ]
    
    var supportItems: [ProfileModel.Item] = [
        .init(image: .phone, title: "Bizimlə əıaqə"),
        .init(image: .information, title: "FAQ"),
        .init(image: .shield, title: "Gizlilik siyasəti")
    ]
}
