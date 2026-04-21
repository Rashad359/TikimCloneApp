//

import SwiftUI

struct SearchView: View {
    @State private var viewModel = SearchViewModel()
    
    var body: some View {
        VStack {
            CustomSearchBar(text: $viewModel.searchText)
            
            if viewModel.searchText.isEmpty {
                // <- Add previous search categories
                Spacer()
                
                Image("searchEmpty")
                
                Spacer()
            } else {
                
                if viewModel.searchResults.isEmpty {
                    Spacer()
                    
                    Image("searchEmpty")
                    
                    Spacer()
                } else {
                    ScrollView {
                        ForEach(viewModel.searchResults, id: \.id) { result in
                            let index = viewModel.searchResults.firstIndex(where: { $0.id == result.id}) ?? 0
                            
                            // Suggested Products list
                            if index == 2 {
                                BaseTitle(title: "Popular Stores", buttonAction: nil)
                                    .padding(.horizontal, 16)
                                
                                SuggestedProducts(data: viewModel.homeData())
                            }
                            
                            HStack {
                                SearchCategory(result: result)
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
        .onChange(of: viewModel.searchText) { oldValue, newValue in
            viewModel.searchResults = viewModel.homeData().searchItems.filter { item in
                item.name.lowercased().contains(viewModel.searchText.lowercased())
            }
        }
    }
}

#Preview("Search") {
    SearchView()
}
