//

import SwiftUI

struct CategoryView: View {
    
    @State private var viewModel = CategoryViewModel()
    
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(0..<viewModel.categories.count, id: \.self) { index in
                    NavigationLink {
                        CategoryDetailsView(title: viewModel.categories[index].categoryName)
                    } label: {
                        BaseCategories(
                            categoryName: viewModel.categories[index].categoryName,
                            categoryImage: viewModel.categories[index].categoryImage,
                            backgroundColor: viewModel.categories[index].categoryColor
                        )
                    }
                }
            }
        }
        .padding(.horizontal, 16)
        .navigationTitle("Categories")
        .navigationBarTitleDisplayMode(.inline)
        
        Spacer()
    }
}

#Preview {
    CategoryView()
}
