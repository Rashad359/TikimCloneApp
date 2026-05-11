//

import SwiftUI

class HomeModel {
    
    struct HomeData: Codable {
        
        let banners: [String]
        let discountItems: [DiscountItemsData]
        let popStoreItems: [PopStoreItemsData]
        let searchItems: [SearchResultData]
        let suggestedProducts: [SuggestedProductsData]
        
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
        
        struct SearchResultData: Codable {
            let id = UUID()
            let image: String
            let name: String
            let description: String
            let location: String
            
            enum CodingKeys: String, CodingKey {
                case image, name, description, location
            }
        }
    
        struct SuggestedProductsData: Codable {
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
