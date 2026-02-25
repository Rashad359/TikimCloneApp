//

import Foundation
internal import Combine

class CategoryViewModel: ObservableObject {
    @Published var categories: [HomeModel.CategoryData] = [
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
}
