//

import SwiftUI

struct DiscountItemsView: View {
    let data: HomeModel.HomeData
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 12) {
                ForEach(0..<data.discountItems.count, id: \.self) { index in
                    VStack(alignment: .leading, spacing: 12) {
                        AsyncImage(url: URL(string: data.discountItems[index].image), content: { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 212, height: 129)
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
                                                        
                                                        Text("\(data.discountItems[index].discount.clean)%")
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
                        }, placeholder: {
                            ProgressView()
                                .frame(width: 212, height: 129)
                        })
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(data.discountItems[index].name)
                            
                            Text(data.discountItems[index].location)
                                .foregroundStyle(.textGray)
                                .fontWeight(.regular)
                                .font(.system(size: 12))
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
