//

import SwiftUI

struct BaseMinimizedCategories: View {
    let categoryName: String
    
    let categoryImage: ImageResource
    
    let onTap: (() -> ())?
    
    var body: some View {
        HStack {
            Image(categoryImage)
                .resizable()
                .frame(width: 24, height: 24)
            
            Text(categoryName)
        }
        .onTapGesture {
            onTap?()
        }
        .padding(.vertical, 12)
        .padding(.leading, 8)
        .padding(.trailing, 10)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 6))
    }
}

#Preview {
    BaseMinimizedCategories(categoryName: "Category", categoryImage: .grid, onTap: nil)
}
