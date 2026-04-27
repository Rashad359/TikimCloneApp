//
//  SellerCategoryView.swift
//  Tikim
//
//  Created by Rashad on 27.04.26.
//

import SwiftUI

struct SellerCategoryView: View {
    var categories: [String]
    @State private var selectedIndex: Int = 0
    var onCategoryTapped: (String) -> Void
    
    @Namespace private var underlineNamespace
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(0..<categories.count, id: \.self) { index in
                        VStack(spacing: 10) {
                            Text(categories[index])
                                .foregroundStyle(selectedIndex == index ? .baseBlue : .gray)
                                .bold()
                            
                            ZStack {
                                Color.clear
                                
                                if selectedIndex == index {
                                    RoundedRectangle(cornerRadius: 2)
                                        .fill(Color.baseBlue)
                                        .matchedGeometryEffect(id: "underline", in: underlineNamespace)
                                }
                            }
                            .frame(height: 3)
                        }
                        .onTapGesture {
                            withAnimation(.easeOut(duration: 0.2)) {
                                selectedIndex = index
                            }
                            onCategoryTapped(categories[index])
                        }
                    }
                }
                .padding(.leading, 10)
            }
            .scrollTargetLayout()
            .scrollTargetBehavior(.viewAligned)
            
            Divider()
                .padding(.top, -1)
        }
        .padding(.top, 20)
        .background(
            Color.white
        )
    }
}

//#Preview {
//    SellerCategoryView(categories: ["this", "that", "then", "and", "sldfjslkdfjsldkfj"])
//}
