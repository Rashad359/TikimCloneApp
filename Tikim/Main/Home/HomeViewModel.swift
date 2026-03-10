//

import SwiftUI
internal import Combine

class HomeViewModel: ObservableObject {
    
   @Published var categories: [HomeModel.CategoryData] = [
        .init(categoryName: "Kateqoriya", categoryImage: .grid, categoryColor: .categoryBlue),
        .init(categoryName: "Santexnika aksesuarlar", categoryImage: .tools, categoryColor: .categoryOrange),
        .init(categoryName: "El alerleri", categoryImage: .constructionTools, categoryColor: .categoryGreen),
        .init(categoryName: "Berkidici elementler", categoryImage: .bolts, categoryColor: .categoryCyan),
        .init(categoryName: "Boya ve levazimatlari", categoryImage: .paint, categoryColor: .categoryLightGreen),
        .init(categoryName: "Gips əsaslı suvaqlar", categoryImage: .grunt, categoryColor: .categoryPink),
        .init(categoryName: "Qıfıl və aksesuarları", categoryImage: .doorFurniture, categoryColor: .categoryBlue2),
        .init(categoryName: "Plastik borular və fitinqlər", categoryImage: .bluePipes, categoryColor: .categoryPurple),
        .init(categoryName: "Metal borular və fitinqlər", categoryImage: .pipes, categoryColor: .categoryBlue2),
        .init(categoryName: "Kazanlizasiya boruları və fitinqlər", categoryImage: .sinkPipe, categoryColor: .categoryGreen2),
        .init(categoryName: "Su kranları və qarışdırıcılar", categoryImage: .sink, categoryColor: .categoryBlue2),
        .init(categoryName: "Hamam avadanlıqarı", categoryImage: .bathFurniture, categoryColor: .categoryGreen2),
        .init(categoryName: "Su qızdırıcıları", categoryImage: .controller, categoryColor: .categoryOrange),
    ]
    
    @Published var currentID: Int? = 0
    
    @Published var ScrollOffset: CGFloat = 0
    
    @Published var presentCategories: Bool = false
    
    @Published var presentCategoryDetails: Bool = false
    
    private var networkManager = NetworkManager.shared
    
    lazy var homeData: HomeModel.HomeData = networkManager.load("HomeData.json")
}

struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}
