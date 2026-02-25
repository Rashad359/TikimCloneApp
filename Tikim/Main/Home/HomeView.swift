//

import SwiftUI

struct HomeView: View {
    
    @State private var currentID: Int? = 0
    
    @State private var ScrollOffset: CGFloat = 0
    
    @State private var presentCategories: Bool = false
    
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
                                
                                BannerView(currentID: $currentID, data: viewModel.homeData)
    //                                .padding(.bottom, 32)
                                
                                BaseTitle(title: "Endirimli mehsullar", buttonAction: nil)
                                
                                DiscountItemsView(data: viewModel.homeData)
                                    .padding(.top, 12)
    //                                .padding(.bottom, 40)
                                
                                BaseTitle(title: "Popular Stores", buttonAction: nil)
    //                                .padding(.bottom, 12)
                                 
                                PopStoresView(data: viewModel.homeData)
                            }
    //                        .padding(.top, 16)
                            .padding(.vertical, 10)
                            .background(GeometryReader { geo in
                                Color.baseBackground.preference(key: ViewOffsetKey.self, value: -geo.frame(in: .named("scroll")).origin.y)
                            })
                            .onPreferenceChange(ViewOffsetKey.self, perform: { value in
                                ScrollOffset = value
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
                                .background(Color.baseBackground)
                                .opacity(ScrollOffset > 20 ? 1 : 0)
                                .animation(.spring(duration: 0.15), value: ScrollOffset > 20)
                        }
                        .clipShape(
                            .rect(topLeadingRadius: 20, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 20)
                        )

                    }
            }
            .ignoresSafeArea()
            .navigationDestination(isPresented: $presentCategories) {
                CategoryView()
            }
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
                ForEach(viewModel.categories.indices, id: \.self) {index in
                    BaseCategories(categoryName: viewModel.categories[index].categoryName, categoryImage: viewModel.categories[index].categoryImage, backgroundColor: viewModel.categories[index].categoryColor) {
                        switch index {
                        case 0:
                            presentCategories = true
                        default:
                            print("go to somewhere else")
                        }
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
                    BaseMinimizedCategories(categoryName: viewModel.categories[index].categoryName, categoryImage: viewModel.categories[index].categoryImage) {
                        switch index {
                        case 0: // categories
                            presentCategories = true
                        default:
                            print("Go to selected category")
                        }
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 12)
        }
        .frame(height: 80)
    }
}


#Preview("Home") {
    HomeView()
}

struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}
