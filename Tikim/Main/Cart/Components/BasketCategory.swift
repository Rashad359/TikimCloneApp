//
//  BasketCategory.swift
//  Tikim
//
//  Created by Rashad on 01.04.26.
//

import SwiftUI

struct BasketCategory: View {
    var sellerImage: ImageResource
    var sellerName: String
    var itemImage: ImageResource
    var deliveryDuration: String
    var totalCost: Float
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(sellerImage)
                    .resizable()
                    .frame(width: 52, height: 52)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(sellerName)
                        .font(.system(size: 16))
                        .bold()
                    
                    Text("Catdirilma vaxti \(deliveryDuration) deq")
                        .font(.system(size: 14))
                        .foregroundStyle(.textSub)
                }
            }
            .padding(.top, 12)
            .padding(.horizontal, 12)
            
            Divider()
            
            //Rounded rect w/ the image
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.baseBackground)
                .frame(width: 44, height: 44)
                .overlay(
                    Image(itemImage)
                        .resizable()
                        .frame(width: 20, height: 39)
                )
            
            //Total cost
            
            Text("Toplam: $\(totalCost.cleanWithReminder)")
                .fontWeight(.semibold)
            
            //Details button
            BaseButton(text: "Detallara bax", action: nil)
                .padding(.horizontal, 12)
                .padding(.bottom, 12)
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
