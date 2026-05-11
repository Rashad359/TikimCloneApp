//
//  SuggestedProducts.swift
//  Tikim
//
//  Created by Rashad on 01.04.26.
//

import SwiftUI

struct SuggestedProducts: View {
    var data: HomeModel.HomeData
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 12) {
                ForEach(0..<data.suggestedProducts.count, id: \.self) { index in
                    VStack(alignment: .leading, spacing: 12) {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.baseBackground)
                            .frame(width: 140, height: 140)
                            .overlay(
                                Image(data.suggestedProducts[index].image)
                                
                            )
                            .padding(.top, 4)
                            .padding(.horizontal, 4)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            
                            HStack(alignment: .center) {
                                Text(data.suggestedProducts[index].name)
                                    .font(.system(size: 16))
                                    .fontWeight(.medium)
                                
                                Spacer()
                                
                                HStack(alignment: .center, spacing: 4) {
                                    Text("\(data.suggestedProducts[index].rating.clean)")
                                    
                                    Image(.goldStarFill)
                                        .frame(width: 16, height: 16)
                                }
                            }
                            
                            Text(data.suggestedProducts[index].location)
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

