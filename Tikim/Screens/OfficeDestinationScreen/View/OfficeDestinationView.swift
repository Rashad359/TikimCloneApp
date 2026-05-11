//
//  OfficeDestinationView.swift
//  Tikim
//
//  Created by Rashad on 09.05.26.
//

import SwiftUI
import MapKit

struct OfficeDestinationView: View {
    @Binding var goToAddAddress: Bool
    @Binding var addresses: [LocationModel]
    
    var finalLocation: CLLocationCoordinate2D
    
    @State private var buildingName: String = ""
    @State private var entranceSlashFloor: String = ""
    @State private var comment: String = ""
    @State private var goToConfirmation: Bool = false
    
    var body: some View {
        ZStack {
            Color.baseBackground
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                ScrollView {
                    VStack(spacing: 16) {
                        DestinationInfo(title: "Bina adi", placeholder: "Meselen: X binasi", text: $buildingName)
                        
                        DestinationInfo(title: "Giris / Mertebe", placeholder: "Meselen: A ve ya 3", text: $entranceSlashFloor)
                        
                        DestinationInfo(title: "Kuryer ucun telimat", placeholder: "Məsələn: giriş etdikdə liftə daxil olun və 3 cü mərtəbəy qalxın. Mən orada sizi qarşılayacağam", text: $comment, isMultiLine: true)
                    }
                }
                
                Spacer()
                
                BaseButton(text: "Adresi yadda saxla") {
                    // Change isSelected on all items to false
                    addresses = addresses.map { item in
                        var item = item
                        item.isSelected = false
                        return item
                    }
                    
                    addresses.append(.init(title: buildingName.isEmpty ? "New address" : buildingName, isSelected: true, category: .office, latitude: finalLocation.latitude, longitude: finalLocation.longitude))
                    
                    goToConfirmation = true
                }
                .padding(.bottom, 16)
            }
            .padding(.horizontal, 16)
        }
        .navigationTitle("Cefer cabbarli kucesi 43")
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(isPresented: $goToConfirmation) {
            NewAddressConfirmationView(goToAddAddress: $goToAddAddress)
        }
    }
}

//#Preview {
//    OfficeDestinationView(goToAddAddress: .constant(false))
//}
