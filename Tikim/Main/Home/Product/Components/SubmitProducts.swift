//
//  SubmitProducts.swift
//  Tikim
//
//  Created by Rashad on 20.04.26.
//

import SwiftUI

struct SubmitProducts: View {
    
    var submit: (() -> ())?
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Total Amount")
                    .foregroundStyle(Color.gray)
                    .font(.system(size: 14))
                
                Text("$3.45")
                    .foregroundStyle(Color.baseBlue)
                    .bold()
            }
            
            Spacer()
            
            Button {
                submit?()
            } label: {
                Text("Səbətə əlavə et")
                    .foregroundStyle(Color.white)
                    .padding(.horizontal, 42)
                    .padding(.vertical, 14)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.baseBlue)
                    )
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 20)
        .padding(.bottom, 42)
        .background(Color.white)
        
    }
}

#Preview {
    SubmitProducts()
}
