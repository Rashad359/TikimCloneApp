//
//  SearchViewModel.swift
//  Tikim
//
//  Created by Rashad on 31.03.26.
//

import SwiftUI

@Observable
final class SearchViewModel {
    private var networkManager = NetworkManager.shared
    
    func homeData() -> HomeModel.HomeData {
        networkManager.load("HomeData.json")
    }
}
