//
//  ProductViewModel.swift
//  Tikim
//
//  Created by Rashad on 20.04.26.
//

import SwiftUI

@Observable
final class ProductViewModel {
    var numberOfCores: [OptionItem] = [
        .init(text: "2 core", isSelected: true),
        .init(text: "3 core", isSelected: false),
        .init(text: "4 core", isSelected: false),
        .init(text: "5 core", isSelected: false),
    ]
    
    var colors: [OptionItem] = [
        .init(text: "Black", isSelected: true),
        .init(text: "White", isSelected: false),
        .init(text: "Gray", isSelected: false),
        .init(text: "Blue", isSelected: false),
        .init(text: "Red", isSelected: false),
        .init(text: "Yellow", isSelected: false),
    ]
    
    var cableLenghts: [OptionItem] = [
        .init(text: "10m", isSelected: true),
        .init(text: "25m", isSelected: false),
        .init(text: "50m", isSelected: false),
    ]
    
    var showLightBox = false
    
    let imageHeight: CGFloat = 400
    
    func selectItem(at index: Int, items: inout [OptionItem]) {
        for i in items.indices {
            items[i].isSelected = (i == index)
        }
    }
}
