//
//  CartViewModel.swift
//  Tikim
//
//  Created by Rashad on 01.04.26.
//

import SwiftUI

@Observable
final class CartViewModel {
    var categories: [BasketCategory] = [
        .init(
            sellerImage: .popImageTemplate,
            sellerName: "MANAT A",
            itemImage: .searchResult4,
            deliveryDuration: "30-40",
            totalCost: 24.90
        ),
        
        .init(
                sellerImage: .popImageTemplate,
                sellerName: "NORM",
                itemImage: .searchResult4,
                deliveryDuration: "20-30",
                totalCost: 49.10
        ),
    ]
}
