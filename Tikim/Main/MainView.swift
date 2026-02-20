//

import SwiftUI

struct CategoryData {
    let categoryName: String
    let categoryImage: ImageResource
    let categoryColor: Color
}

struct MainView: View {
    
    @State private var currentID: Int? = 0
    
    let categories: [CategoryData] = [
        .init(categoryName: "Kateqoriya", categoryImage: .grid, categoryColor: .categoryBlue),
        .init(categoryName: "Santexnika aksesuarlar", categoryImage: .tools, categoryColor: .categoryOrange),
        .init(categoryName: "El alerleri", categoryImage: .constructionTools, categoryColor: .categoryGreen),
        .init(categoryName: "Berkidici elementler", categoryImage: .bolts, categoryColor: .categoryCyan),
        .init(categoryName: "Boya ve levazimatlari", categoryImage: .paint, categoryColor: .categoryLightGreen),
    ]
    
    var body: some View {
        ZStack {
            Color(.baseBlue)
            
            VStack {
                topView
                
                VStack(spacing: 0) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(alignment: .top, spacing: 12) {
                            ForEach(categories.indices, id: \.self) {index in
                                BaseCategories(categoryName: categories[index].categoryName, categoryImage: categories[index].categoryImage, backgroundColor: categories[index].categoryColor)
                            }
                        }
                        .padding(.horizontal, 10)
                        .padding(.top, 12)
                    }
                    .frame(height: 146)
                    
                    BannerView(currentID: $currentID)
                        .padding(.bottom, 32)
                    
                    BaseTitle(title: "Endirimli mehsullar")
                    
                    DiscountItemsView()
                        .padding(.top, 12)
                    
                    Spacer()
                }
                .padding(.top, 16)
                .background(Color.baseBackground)
                .clipShape(
                    .rect(
                        topLeadingRadius: 20,
                        bottomLeadingRadius: 0,
                        bottomTrailingRadius: 0,
                        topTrailingRadius: 20
                        
                    )
                )
            }
        }
        .ignoresSafeArea()
    }
}

extension MainView {
    private var topView: some View {
        HStack(alignment: .center) {
            Image(.tikimLogo)
            
            Spacer()
            
            Image(.bellIcon)
                .offset(y: -10)
        }
        .padding(.horizontal, 16)
        .padding(.top, 71)
    }
}

#Preview("Main") {
    MainView()
}

#Preview("discount Items") {
    DiscountItemsView()
}
