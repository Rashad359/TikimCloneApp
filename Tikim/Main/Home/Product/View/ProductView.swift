//
//  ProductView.swift
//  Tikim
//
//  Created by Rashad on 20.04.26.
//

import SwiftUI

struct ProductView: View {
    
    @State private var viewModel = ProductViewModel()
    
    @Namespace private var imageNamespace
    
    @State private var confirmed: Bool = false
    
    @State private var currentID: Int? = 0
    
    private var images: [String] = ["productTemplateImage", "sellerItemTemplate", "popImageTemplate", "productTemplateImage", "productTemplateImage"]
    
    @State private var isAnimating = false
    
    func dismissConfirmation() {
        withAnimation(.easeInOut(duration: 1)) {
            isAnimating = false
        } completion: {
            confirmed = false
        }
    }
    
    func show() {
        withAnimation(.easeInOut(duration: 1)) {
            isAnimating = true
        }
    }
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        ZStack {
            
            Color.baseBackground
                .ignoresSafeArea()
            
            ScrollView {
                GeometryReader { geo in
                    let offsetY = geo.frame(in: .global).minY
                    let isScrollingDown = offsetY > 0
                    let progress = max(-offsetY / viewModel.imageHeight, 0)
                    let opacity = max(1 - progress * 1.2, 0)
                    
                    
                    ScrollViewReader { proxy in
                        ScrollView(.horizontal) {
                            HStack(spacing: 0) {
                                ForEach(0..<images.count, id: \.self) { index in
                                    Image(images[index])
                                        .resizable()
                                        .scaledToFill()
                                        .frame(
                                            width: geo.size.width,
                                            height: isScrollingDown
                                            ? viewModel.imageHeight + offsetY
                                            : viewModel.imageHeight
                                        )
                                        .opacity(opacity)
                                        .clipped()
                                        .onTapGesture {
                                            withAnimation(.spring(response: 0.4, dampingFraction: 0.82)) {
                                                viewModel.showLightBox = true
                                            }
                                        }
                                        .id(index)
                                }
                            }
                        }
                        .matchedGeometryEffect(id: "productImage", in: imageNamespace, isSource: !viewModel.showLightBox)
                        .scrollTargetLayout()
                        .scrollTargetBehavior(.paging)
                        .scrollPosition(id: $currentID)
                        .overlay(alignment: .bottomTrailing) {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.white)
                                .frame(width: 64, height: 32)
                                .overlay (
                                    Text("\((currentID ?? 0) + 1)/\(images.count)")
                                        .opacity(opacity)
                                )
                                .padding(.bottom, 30)
                                .padding(.trailing, 30)
                                .opacity(opacity)
                        }
                        .onChange(of: viewModel.showLightBox) { _, isShowing in
                            if !isShowing {
                                proxy.scrollTo(currentID ?? 0, anchor: .leading)
                            }
                        }
                        .offset(y: isScrollingDown ? -offsetY : 0)
                    }
                }
                .frame(height: viewModel.imageHeight)
                
                
                VStack(alignment: .leading) {
                    title
                    
                    Text("High-quality electrical cable suitable for residential and commercial installations. Features flexible copper conductors with PVC insulation for enhanced safety and durability.")
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.gray)
                        .font(.system(size: 14))
                        .padding(.top, 16)
                        .padding(.bottom, 4)
                    
                    productValue
                    
                    Divider()
                        .padding(.vertical, 24)
                    
                    Text("Configure Your Cable")
                        .padding(.bottom, 24)
                        .bold()
                    
                    Text("Number of cores")
                    
                    cores
                    
                    Divider()
                        .padding(.vertical, 16)
                    
                    Text("Color")
                    
                    colors
                    
                    Divider()
                        .padding(.vertical, 16)
                    
                    Text("Cable length")
                    
                    cableLength
                        .padding(.bottom, 24)
                    
                    lengthAdjustment
                    
                    Divider()
                        .padding(.vertical, 24)
                    
                    TechnicalSpecs()
                    
                    seller
                        .padding(.top, 24)
                        .padding(.bottom, 16)
                    
                    ratings
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 16)
                .background(Color.baseBackground)
                .clipShape(
                    UnevenRoundedRectangle(
                        topLeadingRadius: 24,
                        bottomLeadingRadius: 0,
                        bottomTrailingRadius: 0,
                        topTrailingRadius: 24,
                        style: .continuous
                    )
                )
                .padding(.top, -30)
            }
            .opacity(viewModel.showLightBox ? 0 : 1)
            .padding(.bottom, 130)
            .overlay(alignment: .bottom) {
                SubmitProducts() {
                    confirmed = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        dismissConfirmation()
                    }
                }
                
            }
            .ignoresSafeArea()
            
            if viewModel.showLightBox {
                LightBoxView(
                    imageName: "productTemplateImage",
                    namespace: imageNamespace,
                    images: images,
                    isPresented: $viewModel.showLightBox,
                    currentID: $currentID
                )
                .ignoresSafeArea()
                .zIndex(1)
            }
            
            if confirmed {
                ConfirmationView(isAnimating: isAnimating)
                    .ignoresSafeArea()
                    .transaction({ transaction in
                        transaction.disablesAnimations = true
                        
                        transaction.animation = .spring(duration: 0.3, bounce: 0.4)
                    })
                    .onAppear {
                        show()
                    }
                    .zIndex(2)
            }
        }
    }
}

extension ProductView {
    //MARK: - Header
    private var title: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("BV elektrik kablosu")
                    .bold()
                
                Text("SKU: EC-MC-2024")
            }
            
            Spacer()
            
            Image("likeTemplate")
        }
    }
    
    private var productValue: some View {
        HStack(spacing: 2) {
            Text("₼1")
                .foregroundStyle(.baseBlue)
                .bold()
            
            Text("/ 1 kq")
                .font(.system(size: 12))
                .foregroundStyle(.gray)
        }
    }
    
    // MARK: - Options
    private var cores: some View {
        FlowLayout(spacing: 10) {
            ForEach(viewModel.numberOfCores.indices, id: \.self) { index in
                Options(item: viewModel.numberOfCores[index])
                    .onTapGesture {
                        viewModel.selectItem(at: index, items: &viewModel.numberOfCores)
                    }
            }
        }
    }
    
    private var colors: some View {
        FlowLayout(spacing: 10) {
            ForEach(viewModel.colors.indices, id: \.self) { index in
                Options(item: viewModel.colors[index])
                    .onTapGesture {
                        viewModel.selectItem(at: index, items: &viewModel.colors)
                    }
            }
        }
    }
    
    private var cableLength: some View {
        FlowLayout(spacing: 10) {
            ForEach(viewModel.cableLenghts.indices, id: \.self) { index in
                Options(item: viewModel.cableLenghts[index])
                    .onTapGesture {
                        viewModel.selectItem(at: index, items: &viewModel.cableLenghts)
                    }
            }
        }
    }
    
    private var lengthAdjustment: some View {
        RoundedRectangle(cornerRadius: 12)
            .stroke(Color.gray, lineWidth: 1)
            .frame(height: 48)
            .frame(maxWidth: .infinity)
            .overlay {
                HStack {
                    Image("subtractLine")
                    
                    Spacer()
                    
                    Text("1m")
                    
                    Spacer()
                    
                    Image("addLine")
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 14)
            }
    }
    
    private var seller: some View {
        HStack(spacing: 12) {
            Image("popImageTemplate")
                .resizable()
                .frame(width: 40, height: 40)
                .scaledToFill()
                .clipShape(Capsule())
            
            Text("Manat A")
                .bold()
        }
    }
    
    private var ratings: some View {
        HStack {
            VStack(spacing: 8) {
                Text("4,94")
                    .bold()
                
                Image("5Stars")
            }
            
            Spacer()
            
            Divider()
            
            Spacer()
            
            VStack {
                Text("231")
                    .bold()
                
                Text("Deyerlendirme")
            }
            
            Spacer()
            
            Divider()
            
            Spacer()
            
            VStack {
                Text("12")
                    .bold()
                
                Text("Ildir satici")
            }
        }
    }
}

#Preview {
    ProductView()
}
