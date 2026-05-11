//
//  CartView.swift
//  Tikim
//
//  Created by Rashad on 12.03.26.
//

import SwiftUI

struct CartView: View {
    @State private var viewModel: CartViewModel = CartViewModel()
    
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(0..<2, id: \.self) { index in
                    viewModel.categories[index]
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                }
            }
        }
        .background(Color.baseBackground)
        .navigationTitle("Sifarishleriniz")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color.white, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        
        
        
        Spacer()
    }
}

#Preview {
    CartView()
}
