//

import SwiftUI

struct PopStoresView: View {
    let data: HomeModel.HomeData
    @Binding var goToStoreView: Bool
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 12) {
                ForEach(0..<data.popStoreItems.count, id: \.self) { index in
                    VStack(alignment: .leading, spacing: 12) {
                        Image(data.popStoreItems[index].image)
                            .clipShape(RoundedRectangle(cornerRadius: 6))
                            .padding(.top, 4)
                            .padding(.horizontal, 4)
                        
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
                    .onTapGesture {
                        goToStoreView = true
                    }
                }
            }
            .padding(.horizontal, 16)
        }
        .frame(height: 211)
    }
}
