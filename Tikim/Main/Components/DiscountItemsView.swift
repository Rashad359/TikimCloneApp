//

import SwiftUI

struct DiscountItemsView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 12) {
                ForEach(0..<3, id: \.self) { index in
                    VStack(alignment: .leading, spacing: 12) {
                        Image(.discountTemplate)
                            .clipShape(RoundedRectangle(cornerRadius: 6))
                            .padding(.top, 4)
                            .padding(.horizontal, 4)
                            .overlay(
                                VStack {
                                    HStack {
                                        RoundedRectangle(cornerRadius: 27)
                                            .fill(Color.categoryBlue)
                                            .stroke(.buttonBorder, lineWidth: 1)
                                            .frame(width: 54, height: 22, alignment: .topLeading)
                                            .overlay(
                                                HStack(spacing: 2) {
                                                    Image(.discountIcon)
                                                    
                                                    Text("50%")
                                                        .fontWeight(.medium)
                                                        .font(.system(size: 10))
                                                        .foregroundStyle(.baseBlue)
                                                }
                                            )
                                        
                                        Spacer()
                                    }
                                    Spacer()
                                }
                                    .padding(.top, 10)
                                    .padding(.leading, 10)
                            )
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Test title")
                            
                            Text("Test subtitle")
                        }
                        .padding(.horizontal, 4)
                        .padding(.bottom, 8)
                    }
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
            .padding(.horizontal, 16)
        }
        .frame(height: 211)
    }
}
