//
//  LocatoinModel.swift
//  Tikim
//
//  Created by Rashad on 08.05.26.
//

import Foundation

struct LocationModel: Identifiable, Equatable {
    let id = UUID()
    let title: String
    var isSelected: Bool
    let category: AddressCategory // <- Change to enum later
    let latitude: CGFloat
    let longitude: CGFloat
    
    enum CodingKeys: String, CodingKey {
        case title, isSelected, category, latitude, longitude
    }
    
    enum AddressCategory: String {
        case building = "building"
        case home = "addressHome"
        case office = "briefcase"
        case other = "markerPin"
    }
}
