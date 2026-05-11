//
//  AddAddressView.swift
//  Tikim
//
//  Created by Rashad on 08.05.26.
//

import SwiftUI

struct AddAddressView: View {
    @Binding var goToAddAddress: Bool
    @Binding var addresses: [LocationModel]
    
    @State private var searchText: String = ""
    @FocusState private var searchBarFocused: Bool
    @State private var navigateToMapAddress: Bool = false
    
    var body: some View {
        ZStack {
            Color.baseBackground
                .ignoresSafeArea()
            
            if searchBarFocused {
                BaseDimmedBackground()
            }
            
            GeometryReader { geo in
                VStack {
                    VStack(spacing: 8) {
                        SearchBar(searchText: $searchText, searchFocuded: _searchBarFocused)
                        
                        if searchBarFocused {
                            SelectAddressOnMap()
                                .onTapGesture {
                                    searchBarFocused = false
                                    navigateToMapAddress = true
                                }
                        }
                    }
                    .padding(.bottom, 16)
                    .background(Color.white)
                    
                    Spacer()
                    
                    VStack(spacing: 8) {
                        Text("Axtarışdan istifadə edərək ünvanınızı tapın")
                            .font(.system(size: 24, weight: .medium))
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.utilityGray)
                            .padding(.horizontal, 20)
                        
                        Image("NewAddressBackground")
                    }
                    
                    Spacer()
                }
                .frame(width: geo.size.width)
            }
            
        }
        .navigationTitle("Unvan elave et")
        .ignoresSafeArea(.keyboard)
        .navigationDestination(isPresented: $navigateToMapAddress) {
            MapAddressSelectionView(goToAddAddress: $goToAddAddress, addresses: $addresses)
        }
    }
}

#Preview {
    AddAddressView(goToAddAddress: .constant(false), addresses: .constant([.init(title: "sdf", isSelected: false, category: .building, latitude: 20.000, longitude: 20.000)]))
}
