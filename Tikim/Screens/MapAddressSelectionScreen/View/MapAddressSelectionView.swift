//
//  MapAddressSelectionView.swift
//  Tikim
//
//  Created by Rashad on 08.05.26.
//

import SwiftUI
import MapKit

struct MapAddressSelectionView: View {
    @Binding var goToAddAddress: Bool
    @Binding var addresses: [LocationModel]
    
    @State private var cameraPosition: MapCameraPosition = .userLocation(fallback: .automatic)
    
    @State private var navigateToDestinationType: Bool = false
    
    @State private var pinOffset: CGFloat = .zero
    
    @State private var finalLocation: CLLocationCoordinate2D = .init(latitude: .zero, longitude: .zero)
    
//    @State private var selectedLatitude: CGFloat = .zero
//    
//    @State private var selectedLongitude: CGFloat = .zero
    
    var body: some View {
        ZStack {
            Map(position: $cameraPosition) {
                UserAnnotation()
            }
                .environment(\.colorScheme, .dark)
                .overlay(alignment: .center) {
                    VStack(spacing: -5) {
                        Image("locationSelectionPin")
                            .offset(y: pinOffset)
                        
                        Image("locationSelectionShadow")
                    }
                    
                }
                .onMapCameraChange(frequency: .continuous) { context in
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.3, blendDuration: 0.4)) {
                        pinOffset = -20
                        if finalLocation.latitude == .zero || finalLocation.longitude == .zero {
                            finalLocation = context.camera.centerCoordinate
                        }
                    }
                }
                .onMapCameraChange(frequency: .onEnd) { context in
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.3, blendDuration: 0.4)) {
                        pinOffset = 0
                        finalLocation = context.camera.centerCoordinate
                    }
                }
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                VStack(spacing: 20) {
                    HStack{
                        Spacer()
                        
                        Circle()
                            .fill(
                                Color.baseBlue
                                    .opacity(0.1)
                            )
                            .blur(radius: 2, opaque: false)
                            .frame(width: 40, height: 40)
                            .overlay(
                                Image("mark")
                            )
                            .onTapGesture {
                                cameraPosition = .userLocation(fallback: .automatic)
                            }
                    }
                    
                    VStack(spacing: 8) {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white)
                            .frame(height: 44)
                            .overlay(alignment: .leading) {
                                Text("Doğru adresi görənə qədər xəritəni hərəkət etdirin")
                                    .font(.system(size: 14))
                                    .padding(.leading, 14)
                            }
                        
                        BaseButton(text: "Davam et") {
                            navigateToDestinationType = true
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
        }
        .toolbar {
            toolBarContent
        }
        .toolbarBackground(Color.white, for: .navigationBar)
        .navigationDestination(isPresented: $navigateToDestinationType) {
            DestinationTypeView(goToAddAddress: $goToAddAddress, addresses: $addresses, finalLocation: finalLocation)
        }
    }
    
    @ToolbarContentBuilder
    private var toolBarContent: some ToolbarContent {
        ToolbarItem(placement: .principal) {
            Text("Cəfər Cabbarlı küçəsi 43")
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    MapAddressSelectionView(goToAddAddress: .constant(false), addresses: .constant([.init(title: "sdf", isSelected: false, category: .home, latitude: 20.000, longitude: 20.000)]))
}
