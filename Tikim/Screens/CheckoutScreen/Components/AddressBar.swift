//
//  AddressBar.swift
//  Tikim
//
//  Created by Rashad on 07.05.26.
//

import SwiftUI

struct AddressBar: View {
    
    @Binding var addresses: [LocationModel]
    
    @Binding var showSheet: Bool
    
    var selectedAddress: LocationModel {
        let selectedIndex = addresses.firstIndex(where: { $0.isSelected == true } )
        
        return addresses[selectedIndex ?? 0]
    }
    
    var body: some View {
        HStack(spacing: 11) {
            Image(addresses.isEmpty ? "markerPin" : selectedAddress.category.rawValue)
            
            VStack(alignment: .leading) {
                Text(addresses.isEmpty ? "Çatdırılma adresi seçin" : "\(selectedAddress.latitude), \(selectedAddress.longitude)")
                    .font(.system(size: 17, weight: .medium))
                
                Text(addresses.isEmpty ? "Davam etmek ucun toxunun" : selectedAddress.title)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            Image("arrowRight")
                .resizable()
                .renderingMode(.template)
                .foregroundStyle(.black)
                .frame(width: 24, height: 24)
        }
        .padding(8)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
        )
        .onTapGesture {
            showSheet = true
        }
    }
}

#Preview {
    AddressBar(addresses: .constant([.init(title: "ev", isSelected: false, category: .home, latitude: 20.000, longitude: 20.000)]), showSheet: .constant(false))
}
