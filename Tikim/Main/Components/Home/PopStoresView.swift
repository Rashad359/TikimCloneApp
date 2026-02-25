//

import SwiftUI

struct PopStoresView: View {
//    let items: [HomeModel.PopStoresItem]
    let data: HomeModel.HomeData
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 12) {
                ForEach(0..<data.popStoreItems.count, id: \.self) { index in
                    VStack(alignment: .leading, spacing: 12) {
                        AsyncImage(url: URL(string: data.popStoreItems[index].image)) { image in
                            image
                                .clipShape(RoundedRectangle(cornerRadius: 6))
                                .padding(.top, 4)
                                .padding(.horizontal, 4)
                        } placeholder: {
                            ProgressView()
                                .frame(width: 139, height: 139)
                        }

//                        Image(data.popStoreItems[index].image)
//                            .clipShape(RoundedRectangle(cornerRadius: 6))
//                            .padding(.top, 4)
//                            .padding(.horizontal, 4)
                        VStack(alignment: .leading, spacing: 4) {
                            
                            HStack(alignment: .center) {
                                Text(data.popStoreItems[index].name)
                                
                                Spacer()
                                
                                HStack(alignment: .center, spacing: 4) {
                                    Text("\(data.popStoreItems[index].rating.clean)")
                                    
                                    Image(.goldStarFill)
                                        .frame(width: 16, height: 16)
                                }
                            }
                            
                            Text(data.popStoreItems[index].location)
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

#Preview {
    PopStoresView(data: .init(banners: ["Something"], discountItems: [.init(image: "image", name: "name", location: "location", discount: 2.3)], popStoreItems: [.init(image: "image", name: "name", location: "location", rating: 2.3)]))
}
