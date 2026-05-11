//
//  CheckoutView.swift
//  Tikim
//
//  Created by Rashad on 07.05.26.
//

import SwiftUI
import MapKit
import CoreLocationUI

struct CheckoutView: View {
    
    @State private var showLocationsSheet = false
    
    @State private var goToAddAddress = false
    
    @State private var cameraPosition: MapCameraPosition = .userLocation(fallback: .automatic)
    
    @State private var showAutoAddress: Bool = false
    
    @State private var isAnimating: Bool = false
    
    @StateObject private var locationManager = LocationManager()
    
    @State private var addresses: [LocationModel] = []
    
    private var sheetHeight: Double {
        switch addresses.count {
        case 0:
            return 0.28
        case 1:
            return 0.3
        case 2:
            return 0.4
        case 3:
            return 0.45
        default:
            return 0.5
        }
    }
    
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ZStack {
            Color.baseBackground
                .ignoresSafeArea()
            
            
            VStack(spacing: 24) {
                Map(position: $cameraPosition) {
                    UserAnnotation()
                }
                    .frame(height: 200)
                    .padding(.top, 1)
                    .padding(.horizontal, -8)
                    .environment(\.colorScheme, .dark)
                    .overlay(alignment: .bottom) {
                        LinearGradient(colors: [Color.clear, Color.white], startPoint: .top, endPoint: .bottom)
                            .frame(height: 30)
                            .padding(.horizontal, -8)
                    }
                
                AddressBar(addresses: $addresses, showSheet: $showLocationsSheet)
                
                PaymentInfo()
                
                BaseButton(text: "Sifariş eləmə. HƏKİİİİM", action: nil)
                
                Spacer()
            }
            .padding(.horizontal, 8)
            
            if showAutoAddress {
                AutoAddress(
                    isAnimating: $isAnimating,
                    showMessage: $showAutoAddress,
                    addresses: $addresses,
                    latitude: locationManager.userLocation?.latitude ?? 11.1111,
                    longitude: locationManager.userLocation?.longitude ?? 11.1111
                )
                    .ignoresSafeArea()
                    .transaction({ transaction in
                        transaction.disablesAnimations = true
                        
                        transaction.animation = .spring(duration: 0.3, bounce: 0.4)
                    })
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1)) {
                            isAnimating = true
                        }
                    }
                    .zIndex(2)
            }
        }
        .navigationTitle("1001 xirdavat (inshaatcilar)")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showLocationsSheet) {
            LocationsSheet(addresses: $addresses, goToAddAddress: $goToAddAddress)
                .presentationDetents([.fraction(sheetHeight)])
                .presentationDragIndicator(.visible)
                .presentationBackground(Color.white)
        }
        .navigationDestination(isPresented: $goToAddAddress) {
            AddAddressView(goToAddAddress: $goToAddAddress, addresses: $addresses)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                if addresses.isEmpty {
                    showAutoAddress = true
                }
            }
        }
    }
}

#Preview {
    CheckoutView()
}
