//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color(.baseBlue)
                VStack {
                    topView
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 5) {
                            
                            categoriesList
                            
                            BannerView(currentID: $viewModel.currentID, data: viewModel.homeData)
                            
                            BaseTitle(title: "Endirimli mehsullar", buttonAction: nil)
                            
                            DiscountItemsView(data: viewModel.homeData)
                                .padding(.top, 12)
                            
                            BaseTitle(title: "Popular Stores", buttonAction: nil)
                            
                            PopStoresView(data: viewModel.homeData)
                        }
                        .padding(.vertical, 10)
                        .background(GeometryReader { geo in
                            Color.baseBackground.preference(key: ViewOffsetKey.self, value: -geo.frame(in: .named("scroll")).origin.y)
                        })
                        .onPreferenceChange(ViewOffsetKey.self, perform: { value in
                            viewModel.ScrollOffset = value
                        })
                        .clipShape(
                            .rect(
                                topLeadingRadius: 20,
                                bottomLeadingRadius: 0,
                                bottomTrailingRadius: 0,
                                topTrailingRadius: 20
                                
                            )
                        )
                    }
                    .background(Color.baseBackground)
                    .overlay(alignment: .top) {
                        minimizedCategoriesView
                            .frame(height: min(max(0, viewModel.ScrollOffset), 70))
                            .background(Color.baseBackground)
                            .animation(.spring(duration: 0.15), value: viewModel.ScrollOffset > 20)
                    }
                    .clipShape(
                        .rect(topLeadingRadius: 20, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 20)
                    )
                    
                }
            }
            .ignoresSafeArea()
        }
    }
}

extension HomeView {
    private var topView: some View {
        VStack{
            Spacer(minLength: 80)
            HStack(alignment: .center) {
                Image(.tikimLogo)
                
                Spacer()
                
                Image(.bellIcon)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 24, height: 24)
            }
            .padding(.horizontal, 16)
        }
        .frame(height: 60)
        .padding(.vertical, 24)
    }
    
    private var categoriesList: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(alignment: .top, spacing: 12) {
                ForEach(viewModel.categories.indices, id: \.self) { index in
                    NavigationLink {
                        switch index {
                        case 0:
                            CategoryView()
                        default:
                            CategoryDetailsView(title: viewModel.categories[index].categoryName)
                        }
                    } label: {
                        BaseCategories(
                            categoryName: viewModel.categories[index].categoryName,
                            categoryImage: viewModel.categories[index].categoryImage,
                            backgroundColor: viewModel.categories[index].categoryColor
                        )
                    }
                }
            }
            .padding(.horizontal, 16)
        }
        .padding(.vertical, 12)
        
    }
    
    private var minimizedCategoriesView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(alignment: .top, spacing: 12) {
                ForEach(viewModel.categories.indices, id: \.self) { index in
                    NavigationLink {
                        switch index {
                        case 0:
                            CategoryView()
                        default:
                            CategoryDetailsView(title: viewModel.categories[index].categoryName)
                        }
                    } label: {
                        BaseMinimizedCategories(
                            categoryName: viewModel.categories[index].categoryName,
                            categoryImage: viewModel.categories[index].categoryImage
                        )
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 12)
        }
        .padding(.bottom, 12)
    }
}


#Preview("Home") {
    HomeView()
}
