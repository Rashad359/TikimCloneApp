//
//  LocationsSheet.swift
//  Tikim
//
//  Created by Rashad on 07.05.26.
//

import SwiftUI

struct LocationsSheet: View {
    @Binding var addresses: [LocationModel]
    
    @Binding var goToAddAddress: Bool
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 20) {
                Text("Konum")
                    .font(.system(size: 17, weight: .medium))
                
                ForEach(addresses) { address in
                    Address(address: address, leftIcon: address.category.rawValue)
                        .onTapGesture {
                            // Find selected item index
                            let index = addresses.firstIndex(where: { $0.id == address.id }) ?? 0
                            
                            // Change isSelected on all items to false
                            addresses = addresses.map { item in
                                var item = item
                                item.isSelected = false
                                return item
                            }
                            
                            // Make isSelected where user tapped to true
                            for value in addresses {
                                if value.id == address.id {
                                    addresses[index].isSelected = true
                                }
                            }
                            
                            dismiss()
                        }
                }
                
                HStack {
                    AddAddressButton {
                        // Add new address
                        dismiss()
                        goToAddAddress = true
                    }
                    
                    Spacer()
                }
                
                
                
                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.top, 38)
        }
    }
}

struct AddAddressButton: View {
    var action: (() -> ())?
    
    var body: some View {
        Button {
            action?()
        } label: {
            HStack {
                Image("tikimPlus")
                    .resizable()
                    .frame(width: 24, height: 24)
                
                Text("Yeni adress elave et")
            }
            .bold()
            .foregroundStyle(.black)
        }
    }
}

struct Address: View {
    var address: LocationModel
    var leftIcon: String
    
    var body: some View {
        VStack {
            HStack {
                Image(leftIcon)
                
                VStack(alignment: .leading) {
                    Text(address.title)
                    
                    Text("\(address.latitude), \(address.longitude)")
                }
                
                Spacer()
                
                if address.isSelected {
                    Image(systemName: "checkmark")
                }
            }
            .foregroundStyle(address.isSelected ? .baseBlue : .black)
            
            Divider()
        }
    }
}

#Preview {
    LocationsSheet(addresses: .constant([]), goToAddAddress: .constant(false))
}
