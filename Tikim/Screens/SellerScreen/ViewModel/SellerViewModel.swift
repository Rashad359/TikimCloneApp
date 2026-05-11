//
//  SellerViewModel.swift
//  Tikim
//
//  Created by Rashad on 19.04.26.
//

import SwiftUI

@Observable
final class SellerViewModel {
    
    let imageHeight: CGFloat = 250
    
    let sections: [SellerSection] = [
        SellerSection(title: "Sementler", items: [
            SellerItemModel(title: "NORM KLASS A400"),
            SellerItemModel(title: "NORM KLASS B200"),
            SellerItemModel(title: "NORM KLASS C100")
        ]),
        SellerSection(title: "Borular", items: [
            SellerItemModel(title: "NORM KLASS D140"),
            SellerItemModel(title: "NORM KLASS E1234"),
            SellerItemModel(title: "NORM KLASS C324"),
            SellerItemModel(title: "NORM KLASS C100"),
            SellerItemModel(title: "NORM KLASS C100"),
            SellerItemModel(title: "NORM KLASS C100"),
            SellerItemModel(title: "NORM KLASS C100"),
            SellerItemModel(title: "NORM KLASS C100"),
            SellerItemModel(title: "NORM KLASS C100"),
            SellerItemModel(title: "NORM KLASS C100"),
            SellerItemModel(title: "NORM KLASS C100"),
        ])
    ]
}

extension SellerViewModel {
    struct SellerSection: Identifiable {
        let id = UUID()
        let title: String
        let items: [SellerItemModel]
    }

    struct SellerItemModel: Identifiable {
        let id = UUID()
        let title: String
    }
}
