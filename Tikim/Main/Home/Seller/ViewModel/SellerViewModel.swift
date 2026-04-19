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
            SellerItemModel(),
            SellerItemModel(),
            SellerItemModel()
        ]),
        SellerSection(title: "Borular", items: [
            SellerItemModel(),
            SellerItemModel(),
            SellerItemModel(),
            SellerItemModel()
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
    }
}
