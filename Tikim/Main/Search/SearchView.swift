//

import SwiftUI

struct SearchView: View {
    @State private var viewModel = SearchViewModel()
    @State private var searchText = ""
    @State private var searchResults: [HomeModel.HomeData.SearchResultData] = []
    
    var body: some View {
        VStack {
            CustomSearchBar(text: $searchText)
            
            if searchText.isEmpty {
                // <- Add previous search categories
                Spacer()
                
                Image("searchEmpty")
                
                Spacer()
            } else {
                
                if searchResults.isEmpty {
                    Spacer()
                    
                    Image("searchEmpty")
                    
                    Spacer()
                } else {
                    ScrollView {
                        ForEach(0..<searchResults.count, id: \.self) { index in
                            
                            // Suggested Products list
                            if index == 2 {
                                BaseTitle(title: "Popular Stores", buttonAction: nil)
                                    .padding(.horizontal, 16)
                                
                                SuggestedProducts(data: viewModel.homeData())
                            }
                            
                            HStack {
                                SearchCategory(result: searchResults[index])
                                    .padding(.vertical, 10)
                                
                                Spacer()
                            }
                            .padding(.horizontal, 16)
                            
                            Divider()
                                .padding(.horizontal, 16)
                        }
                    }
                    .background(Color.baseBackground)
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .onChange(of: searchText) { oldValue, newValue in
            searchResults = viewModel.homeData().searchItems.filter { item in
                item.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
}

#Preview("Search") {
    SearchView()
}

struct SearchCategory: View {
    var result: HomeModel.HomeData.SearchResultData
    
    var body: some View {
        HStack(spacing: 12) {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.white)
                .frame(width: 64, height: 64)
                .overlay(
                    Image(result.image)
                )
            
            VStack(alignment: .leading, spacing: 2) {
                Text(result.name)
                    .font(.system(size: 16))
                    .bold()
                
                Text(result.description)
                    .foregroundStyle(Color.textGray)
                    .font(.system(size: 14))
                
                Text(result.location)
                    .foregroundStyle(Color.textGray)
                    .font(.system(size: 14))
            }
        }
    }
}

struct SuggestedProducts: View {
    var data: HomeModel.HomeData
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 12) {
                ForEach(0..<data.suggestedProducts.count, id: \.self) { index in
                    VStack(alignment: .leading, spacing: 12) {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.baseBackground)
                            .frame(width: 140, height: 140)
                            .overlay(
                                Image(data.suggestedProducts[index].image)
                                
                            )
                            .padding(.top, 4)
                            .padding(.horizontal, 4)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            
                            HStack(alignment: .center) {
                                Text(data.suggestedProducts[index].name)
                                    .font(.system(size: 16))
                                    .fontWeight(.medium)
                                
                                Spacer()
                                
                                HStack(alignment: .center, spacing: 4) {
                                    Text("\(data.suggestedProducts[index].rating.clean)")
                                    
                                    Image(.goldStarFill)
                                        .frame(width: 16, height: 16)
                                }
                            }
                            
                            Text(data.suggestedProducts[index].location)
                                .foregroundStyle(.textGray)
                                .fontWeight(.regular)
                                .font(.system(size: 12))
                        }
                        .padding(.horizontal, 4)
                        .padding(.bottom, 8)
                    }
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
            .padding(.horizontal, 16)
        }
        .frame(height: 211)
    }
}
