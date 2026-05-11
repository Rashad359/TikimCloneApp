//
//  NewAddressConfirmationView.swift
//  Tikim
//
//  Created by Rashad on 11.05.26.
//

import SwiftUI

struct NewAddressConfirmationView: View {
    @Binding var goToAddAddress: Bool
    
    var body: some View {
        VStack {
            TopCircle(image: .check)
            
            Text("Adres uğurla əlavə olundu")
                .font(.system(size: 24, weight: .medium))
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                goToAddAddress = false
            }
        }
    }
}

#Preview {
    NewAddressConfirmationView(goToAddAddress: .constant(false))
}
