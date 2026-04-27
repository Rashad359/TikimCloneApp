//
//  SellerView.swift
//  Tikim
//
//  Created by Rashad on 16.04.26.
//

import SwiftUI

struct SellerView: View {
    
    @State private var viewModel = SellerViewModel()
    
    @State private var goToProducts: Bool = false
    
    @State private var searchText: String = ""
    
    @State private var scrollOffsetY: CGFloat = 0
    
    @State private var categoryBarHeight: CGFloat = 0
    
    private var categories: [String] = ["Sementler", "Borular"]
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.baseBackground
                .ignoresSafeArea()
            
            ScrollViewReader { proxy in
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
                                .onChange(of: offsetY) { oldValue, newValue in
                                    scrollOffsetY = offsetY
                                }
                        }
                        .frame(height: viewModel.imageHeight)
                        
                        // MARK: - Content
                        VStack(alignment: .leading, spacing: 20) {
                            sellerBanner
                                .padding(.top, 12)
                            
                            ForEach(viewModel.sections) { section in
                                
                                SellerHeaderView(title: section.title)
                                    .id(section.title)
                                
                                ForEach(section.items) { item in
                                    SellerItem()
                                        .background(Color.white)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                        .onTapGesture {
                                            goToProducts = true
                                        }
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
                .overlay(alignment: .top) {
                    SellerCategoryView(categories: categories) { category in
                        withAnimation {
                            proxy.scrollTo(category, anchor: UnitPoint(x: 0.23, y: 0.23))
                        }
                    }
                    .opacity(max(-scrollOffsetY / (viewModel.imageHeight * 0.7), 0))
                }
            }
        }
        .navigationBarBackButtonHidden()
        .navigationDestination(isPresented: $goToProducts) {
            ProductView()
        }
        .toolbar {
            toolbar
        }
    }
    
    //MARK: - Toolbar
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent {
        if #available(iOS 26.0, *) {
            ToolbarItem(placement: .topBarLeading) {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white)
                    .stroke(Color.strokeSub, lineWidth: 1)
                    .frame(width: 40, height: 40)
                    .overlay(
                        Image("arrowLeftIcon")
                            .resizable()
                            .frame(width: 20, height: 20)
                    )
                    .opacity(max(-scrollOffsetY / viewModel.imageHeight, 0))
                    .onTapGesture {
                        dismiss()
                    }
            }
            .sharedBackgroundVisibility(.hidden)
        } else {
            ToolbarItem(placement: .topBarLeading) {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white)
                    .stroke(Color.strokeSub, lineWidth: 1)
                    .overlay(
                        Image("arrowLeftIcon")
                            .resizable()
                            .frame(width: 20, height: 20)
                    )
                    .opacity(max(-scrollOffsetY / viewModel.imageHeight, 0))
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
        
        if #available(iOS 26.0, *) {
            ToolbarItem(placement: .principal) {
                
                ZStack {
                    TextField("", text: $searchText)
                        .frame(width: UIScreen.main.bounds.width * 0.7, height: 40)
                        .padding(.horizontal, 10)
                        .foregroundStyle(.black)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.white)
                                .stroke(Color.strokeSub, lineWidth: 1)
                        )
                        .opacity(max(-scrollOffsetY / viewModel.imageHeight, 0))
                    
                    if searchText.isEmpty {
                        HStack(spacing: 8) {
                            Image("mainSearchIcon")
                            
                            Text("Search")
                            
                            Spacer()
                        }
                        .foregroundStyle(Color.gray)
                        .padding(.leading, 10)
                        .opacity(max(-scrollOffsetY / viewModel.imageHeight, 0))
                        .allowsHitTesting(false)
                    }
                }
            }
            .sharedBackgroundVisibility(.hidden)
        } else {
            ToolbarItem(placement: .principal) {
                TextField("Search", text: $searchText)
                    .frame(width: UIScreen.main.bounds.width * 0.7, height: 40)
                    .padding(.horizontal, 10)
                    .foregroundStyle(.black)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white)
                    )
                    .opacity(max(-scrollOffsetY / viewModel.imageHeight, 0))
                    .onChange(of: scrollOffsetY) { oldValue, newValue in
                        print("Offset Y: \(scrollOffsetY)")
                    }
            }
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
