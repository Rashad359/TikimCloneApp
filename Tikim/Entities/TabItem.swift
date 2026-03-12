//
//  TabItem.swift
//  Tikim
//
//  Created by Rashad on 10.03.26.
//

import Foundation

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
