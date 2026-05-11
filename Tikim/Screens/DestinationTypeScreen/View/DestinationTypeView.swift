//
//  DestinationTypeView.swift
//  Tikim
//
//  Created by Rashad on 08.05.26.
//

import SwiftUI
import MapKit

struct DestinationTypeView: View {
    
    enum Navigate {
        case building
        case home
        case office
        case other
    }
    
    @Binding var goToAddAddress: Bool
    @Binding var addresses: [LocationModel]
    
    var finalLocation: CLLocationCoordinate2D
    
    @State private var navigation: Navigate? = nil
    
    var body: some View {
        ZStack {
            Color.baseBackground
                .ignoresSafeArea()
            
            VStack(spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Çatdırlama yeri növünü seçin")
                        .font(.system(size: 24, weight: .bold))
                    
                    Text("Doğru və sürətli çatdırlma etməyimiz üçün bizə adres növünüzü gösdərin.")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundStyle(.gray)
                }
                
                VStack(spacing: 12) {
                    DestinationType(
                        image: "building",
                        title: "Bina",
                        subtitle: "Çox mənzilli yaşayış binası"
                    ) {
                        navigation = .building
                    }
                    
                    DestinationType(
                        image: "addressHome",
                        title: "Ev",
                        subtitle: "Müstəqil ev vəya dubleks"
                    ) {
                        navigation = .home
                    }
                    
                    DestinationType(
                        image: "briefcase",
                        title: "Ofis",
                        subtitle: "Giriş məhdudiyyəti olan iş yeri (məs; şirkətin ofisi)"
                    ) {
                        navigation = .office
                    }
                    
                    DestinationType(
                        image: "markerPin",
                        title: "Diger",
                        subtitle: "Çöl məkanlar vəya qeyri - yaşayış binası (məs; park, xəstəxana, event əraziləri)"
                    ) {
                        navigation = .other
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.top, 20)
        }
        .navigationTitle("Cəfər Cabbarlı küçəsi 43")
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(item: $navigation) { navigate in
            switch navigate {
            case .home:
                HomeDestinationView(goToAddAddress: $goToAddAddress, addresses: $addresses, finalLocation: finalLocation)
            case .building:
                BuildingDestinationView(goToAddAddress: $goToAddAddress, addresses: $addresses, finalLocation: finalLocation)
            case .office:
                OfficeDestinationView(goToAddAddress: $goToAddAddress, addresses: $addresses, finalLocation: finalLocation)
            case .other:
                OtherDestinationView(goToAddAddress: $goToAddAddress, addresses: $addresses, finalLocation: finalLocation)
            }
        }
    }
}



#Preview {
    DestinationTypeView(goToAddAddress: .constant(false), addresses: .constant([.init(title: "sdf", isSelected: false, category: .home, latitude: 20.000, longitude: 20.000)]), finalLocation: .init(latitude: .zero, longitude: .zero))
}
