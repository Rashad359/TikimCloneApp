//
//  SellerItem.swift
//  Tikim
//
//  Created by Rashad on 19.04.26.
//

import SwiftUI

struct SellerItem: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("NORM KLASS A400")
                
                Text("CEM II/B-L 32.5R")
                
                Text("3 kq")
                
                Text("24.43$")
            }
            
            Spacer()
            
            Image("sellerItemTemplate")
                .clipShape(RoundedRectangle(cornerRadius: 6))
        }
        .padding(10)
    }
}

#Preview {
    SellerItem()
}
