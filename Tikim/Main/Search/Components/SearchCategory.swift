//
//  SearchCategory.swift
//  Tikim
//
//  Created by Rashad on 01.04.26.
//

import SwiftUI

struct SearchCategory: View {
    var result: HomeModel.HomeData.SearchResultData
    
    var body: some View {
        HStack(spacing: 12) {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.white)
                .frame(width: 64, height: 64)
                .overlay(
                    Image(result.image)
                )
            
            VStack(alignment: .leading, spacing: 2) {
                Text(result.name)
                    .font(.system(size: 16))
                    .bold()
                
                Text(result.description)
                    .foregroundStyle(Color.textGray)
                    .font(.system(size: 14))
                
                Text(result.location)
                    .foregroundStyle(Color.textGray)
                    .font(.system(size: 14))
            }
        }
    }
}
