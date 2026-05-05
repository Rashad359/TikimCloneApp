//
//  MapView.swift
//  Tikim
//
//  Created by Rashad on 04.05.26.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 51.5072222, longitude: -0.1275),
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        )
    )
    
    @State private var pinOffset: CGFloat = .zero
    
    var body: some View {
        VStack {
            Map(position: $position)
                .mapStyle(.hybrid(elevation: .realistic))
                .overlay(alignment: .center) {
                    Image(systemName: "mappin")
                        .resizable()
                        .frame(width: 20, height: 40)
                        .offset(y: pinOffset)
                }
                .onMapCameraChange(frequency: .continuous) { context in
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.3, blendDuration: 0.4)) {
                        pinOffset = -20
                    }
                }
                .onMapCameraChange { context in
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.3, blendDuration: 0.4)) {
                        pinOffset = 0
                    }
                }
            
            HStack(spacing: 50) {
                Button("Paris") {
                    position = MapCameraPosition.region(
                        MKCoordinateRegion(
                            center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522),
                            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                        )
                    )
                }
                
                Button("Tokyo") {
                    position = MapCameraPosition.region(
                        MKCoordinateRegion(
                            center: CLLocationCoordinate2D(latitude: 35.6897, longitude: 139.6922),
                            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                        )
                    )
                }
            }
        }
    }
}


#Preview {
    MapView()
}
