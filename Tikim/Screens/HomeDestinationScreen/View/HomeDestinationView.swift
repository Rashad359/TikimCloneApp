//
//  HomeDestinationView.swift
//  Tikim
//
//  Created by Rashad on 09.05.26.
//

import SwiftUI
import MapKit

struct HomeDestinationView: View {
    @Binding var goToAddAddress: Bool
    @Binding var addresses: [LocationModel]
    
    var finalLocation: CLLocationCoordinate2D
    
    @State private var addressPrefix: String = ""
    @State private var streetName: String = ""
    @State private var nameOnTheDoorOrNumber: String = ""
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
                            
                            DestinationInfo(title: "Qapidaki ad ve ya nomre", placeholder: "Meselen: Mustafayev ve ya 12", text: $nameOnTheDoorOrNumber)
                            
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
                        
                        addresses.append(.init(title: addressPrefix.isEmpty ? "New address" : addressPrefix, isSelected: true, category: .home, latitude: finalLocation.latitude, longitude: finalLocation.longitude))
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

#Preview {
    HomeDestinationView(goToAddAddress: .constant(false), addresses: .constant([.init(title: "sdf", isSelected: false, category: .home, latitude: 20.000, longitude: 20.000)]), finalLocation: .init(latitude: .zero, longitude: .zero))
}
