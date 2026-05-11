//

import SwiftUI

struct CategoryDetailsView: View {
    let title: String
    
    var body: some View {
        ZStack {
            Color.baseBackground
                .ignoresSafeArea()
            
            ScrollView(.vertical) {
                VStack(spacing: 16) {
                    ForEach(0...6, id: \.self) { index in
                        categoryCard
                    }
                }
            }
        }
        .navigationTitle(title)
    }
}

#Preview {
    CategoryDetailsView(title: "This title")
}

extension CategoryDetailsView {
    private var categoryCard: some View {
        VStack {
            HStack {
                // left view
                HStack {
                    Image(.categoryTemplate)
                        .resizable()
                        .frame(width: 44, height: 44)
                    
                    VStack(alignment: .leading) {
                        Text("Hardware store")
                            .font(.system(size: 14))
                        
                        HStack {
                            Image(.star01)
                            
                            Text("4.5")
                        }
                    }
                }
                
                Spacer()
                
                // right view
                VStack(alignment: .trailing) {
                    Text("Be / Cume")
                    
                    Text("09:00 - 20:00")
                }
            }
            .padding(16)
            
            
            Divider()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(0..<5, id: \.self) { index in
                        VStack {
                            RoundedRectangle(cornerRadius: 8)
                                .frame(width: 100, height: 100)
                                .overlay(
                                    Image(.cementTemplate)
                                )
                                .foregroundStyle(.categoryBackground)
                            
                            Text("Eco Cement")
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
            .padding(.vertical, 16)
        }
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.clear)
                .stroke(Color.gray, lineWidth: 1)
        )
        .padding(.horizontal, 16)
    }
}
