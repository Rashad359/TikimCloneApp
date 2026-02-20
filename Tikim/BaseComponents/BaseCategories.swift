//

import SwiftUI

struct BaseCategories: View {
    
    let categoryName: String
    
    let categoryImage: ImageResource
    
    let backgroundColor: Color
    
    var body: some View {
        VStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 8)
                .fill(backgroundColor)
                .frame(width: 72, height: 72)
                .overlay(
                    Image(categoryImage)
                )
            
            Text(categoryName)
                .frame(width: 72, height: 34)
                .font(.system(size: 12))
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.6)
        }
    }
}

#Preview {
    BaseCategories(categoryName: "Boya ve levazimatlari", categoryImage: .checkLine, backgroundColor: .black)
}
