//
//  BuildingDestinationView.swift
//  Tikim
//
//  Created by Rashad on 09.05.26.
//

import SwiftUI
import MapKit

struct BuildingDestinationView: View {
    @Binding var goToAddAddress: Bool
    @Binding var addresses: [LocationModel]
    
    var finalLocation: CLLocationCoordinate2D
    
    @State private var addressPrefix: String = ""
    @State private var streetName: String = ""
    @State private var buildingName: String = ""
    @State private var blockFloor: String = ""
    @State private var comment: String = ""
    @State private var goToConfirmation: Bool = false
    
    var body: some View {
        ZStack {
            Color.baseBackground
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                ScrollView {
                    VStack(spacing: 16) {
                        DestinationInfo(title: "Adress basligi", placeholder: "Meselen: Evim, is yerim ve s.", text: $addressPrefix)
                        
                        DestinationInfo(title: "Kuce adi", placeholder: "Meselen: Cefer Cabbarli 74", text: $streetName)
                        
                        DestinationInfo(title: "Bina adi", placeholder: "Meselen: X binasi", text: $buildingName)
                        
                        DestinationInfo(title: "Blok / Mertebe", placeholder: "Meselen: Blok 2 menzil 29", text: $blockFloor)
                        
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
                    
                    addresses.append(.init(title: addressPrefix.isEmpty ? "New address" : addressPrefix, isSelected: true, category: .building, latitude: finalLocation.latitude, longitude: finalLocation.longitude))
                    
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
//    BuildingDestinationView(goToAddAddress: .constant(false))
//}
