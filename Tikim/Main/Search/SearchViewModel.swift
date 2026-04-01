//
//  SearchViewModel.swift
//  Tikim
//
//  Created by Rashad on 31.03.26.
//

import SwiftUI

@Observable
final class SearchViewModel {
    var searchText = ""
    var searchResults: [HomeModel.HomeData.SearchResultData] = []
    
    private var networkManager = NetworkManager.shared
    
    func homeData() -> HomeModel.HomeData {
        networkManager.load("HomeData.json")
    }
}
