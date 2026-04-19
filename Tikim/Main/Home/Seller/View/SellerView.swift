//
//  SellerView.swift
//  Tikim
//
//  Created by Rashad on 16.04.26.
//

import SwiftUI

struct SellerView: View {
    
    @State private var viewModel = SellerViewModel()
    
    var body: some View {
        ZStack {
            Color.baseBackground
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    
                    // MARK: - Parallax Image
                    GeometryReader { geo in
                        let offsetY = geo.frame(in: .global).minY
                        let isScrollingDown = offsetY > 0
                        let progress = max(-offsetY / viewModel.imageHeight, 0)
                        let scale = max(1 - progress * 0.15, 0.85)
                        let opacity = max(1 - progress * 1.2, 0)
                        
                        Image("sellerTemplate")
                            .resizable()
                            .scaledToFill()
                            .frame(
                                width: isScrollingDown
                                ? geo.size.width + 50
                                : geo.size.width + 50 + max(offsetY, -50),
                                height: isScrollingDown
                                ? viewModel.imageHeight + offsetY
                                : viewModel.imageHeight * scale
                            )
                            .clipShape(
                                ArcBottomShape(arcHeight: 60)
                            )
                            .opacity(opacity)
                            .offset(y: isScrollingDown ? -offsetY : 0)
                            .padding(.horizontal, isScrollingDown ? -25 : -max(offsetY, -50) / 2 - 25)
                    }
                    .frame(height: viewModel.imageHeight)
                    // MARK: - Content
                    VStack(alignment: .leading, spacing: 20) {
                        sellerBanner
                            .padding(.top, 12)
                        
                        ForEach(viewModel.sections) { section in
                            SellerHeaderView(title: section.title)
                            
                            ForEach(section.items) { item in
                                SellerItem()
                                    .background(Color.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 40)
                    .padding(.top, -100)
                }
            }
            .ignoresSafeArea(edges: .top)
        }
    }
}

#Preview {
    SellerView()
}

extension SellerView {
    private var sellerBanner: some View {
        VStack {
            Image("logoTemplate")
                .padding(.top, 12)
                .padding(.bottom, 6)
            
            VStack(spacing: 4) {
                Text("NORM Sirketi")
                
                Text("Sement ve insaat mehsullari")
                
                Text("09:00 - 23:00")
            }
            
            Divider()
                .padding(.horizontal, 12)
            
            HStack {
                HStack {
                    Image("locationIcon")
                    
                    Text("Adresse bax")
                }
                
                Spacer()
                
                HStack {
                    Image("phoneIcon")
                    
                    Text("Elaqe saxla")
                }
            }
            .padding(.horizontal, 12)
            .padding(.bottom, 12)
            
        }
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
        )
    }
}
