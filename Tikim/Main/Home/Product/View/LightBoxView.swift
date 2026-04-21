//
//  LightBoxView.swift
//  Tikim
//
//  Created by Rashad on 20.04.26.
//

import SwiftUI

struct LightBoxView: View {
    let imageName: String
    var namespace: Namespace.ID
    @Binding var isPresented: Bool
    @State private var showControls = true
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .matchedGeometryEffect(id: "productImage", in: namespace)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        showControls.toggle()
                    }
                }
            
            if showControls {
                VStack {
                    // Top bar
                    HStack {
                        Button {
                            withAnimation(.spring(response: 0.4, dampingFraction: 0.82)) {
                                isPresented = false
                            }
                        } label: {
                            Image(systemName: "xmark")
                                .padding(10)
                                .background(Color.white.opacity(0.2))
                                .clipShape(Circle())
                        }
                        
                        Spacer()
                        
                        Text("1/1")
                        
                        Spacer()
                        
                        Image(systemName: "heart")
                    }
                    .foregroundStyle(.white)
                    .padding(.horizontal, 16)
                    .padding(.top, 60)
                    
                    Spacer()
                    
                    // Bottom bar
                    HStack {
                        VStack(alignment: .leading, spacing: 6) {
                            Text("NORM KLASS A400")
                            
                            Text("CEM II/B-L 32.5R")
                                .foregroundStyle(.gray)
                            
                            HStack(spacing: 4) {
                                Text("$32")
                                    .bold()
                                
                                Text("/ 40kq")
                                    .foregroundStyle(.gray)
                                    .font(.system(size: 14))
                            }
                        }
                        .padding(.bottom, 50)
                        .foregroundStyle(.white)
                        
                        Spacer()
                    }
                    .padding(.horizontal, 16)
                    
                }
                .transition(.opacity)
            }
        }
        .statusBarHidden()
        .navigationBarBackButtonHidden()
    }
}
