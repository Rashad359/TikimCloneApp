//
//  PaymentInfo.swift
//  Tikim
//
//  Created by Rashad on 07.05.26.
//

import SwiftUI

struct PaymentInfo: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Odeme")
                .bold()
            
            HStack {
                Image("mastercard")
                
                Text("Card ****9235")
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.strokeSub, lineWidth: 1)
            )
            
            paymentCategory(title: "Catdirma", subtitle: "Pulsuz")
            
            paymentCategory(title: "Komissiya", subtitle: "0₼")
            
            paymentCategory(title: "Sifarishin qiymeti", subtitle: "24₼")
            
            paymentCategory(title: "Toplam", subtitle: "24₼")
        }
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
        )
    }
}

#Preview {
    PaymentInfo()
}

struct paymentCategory: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 17, weight: .medium))
            
            Spacer()
            
            Text(subtitle)
                .bold()
        }
    }
}
