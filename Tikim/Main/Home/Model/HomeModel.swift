//

import SwiftUI

class HomeModel {
    
    struct HomeData: Codable {
        
        let banners: [String]
        let discountItems: [DiscountItemsData]
        let popStoreItems: [PopStoreItemsData]
        
        struct DiscountItemsData: Codable {
            let image: String
            let name: String
            let location: String
            let discount: Float
        }
        
        struct PopStoreItemsData: Codable {
            let image: String
            let name: String
            let location: String
            let rating: Float
        }
    }
    
    struct CategoryData {
        let categoryName: String
        let categoryImage: ImageResource
        let categoryColor: Color
    }
}
