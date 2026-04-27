//
//  TestView.swift
//  Tikim
//
//  Created by Rashad on 23.04.26.
//

import SwiftUI

struct CustomContextMenuView: View {
    @State private var isMenuVisible = false
    @State private var menuPosition: CGPoint = .zero
    
    
    var body: some View {
        ZStack {
            // 1. Dimmed background tap to dismiss
            if isMenuVisible {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture { isMenuVisible = false }
            }
            
            // 2. Your content
            VStack {
                HStack {
                    Spacer()
                    
                    Text("Tap me")
                        .padding()
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12))
                        .overlay(
                            GeometryReader { geo in
                                Color.clear
                                    .onAppear {
                                        let frame = geo.frame(in: .global)
                                        menuPosition = CGPoint(
                                            x: frame.minX,
                                            y: frame.maxY + 10
                                        )
                                    }
                            }
                        )
                        .onTapGesture {
                            isMenuVisible = true
                        }
                }
                .padding(.trailing, 20)
                
                Spacer()
            }
            
            
            // 3. Your fully custom menu
            if isMenuVisible {
                CustomMenuPopup(isVisible: $isMenuVisible)
                //                    .padding(.trailing, 120)
                    .position(menuPosition) // position dynamically if needed
                    .transition(.scale(scale: 0.8).combined(with: .opacity))
                    .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isMenuVisible)
            }
        }
    }
}

struct CustomMenuPopup: View {
    @Binding var isVisible: Bool
    
    let actions: [(String, String, Color)] = [
        ("Edit",   "pencil",              .primary),
        ("Share",  "square.and.arrow.up", .primary),
        ("Delete", "trash",               .red),
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(actions.indices, id: \.self) { i in
                let (title, icon, color) = actions[i]
                
                Button {
                    isVisible = false
                    // handle action
                } label: {
                    HStack {
                        Text(title).foregroundStyle(color)
                        Spacer()
                        Image(systemName: icon).foregroundStyle(color)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                }
                
                if i < actions.count - 1 {
                    Divider().padding(.horizontal, 12)
                }
            }
        }
        .frame(width: 200)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14))
        .shadow(color: .black.opacity(0.15), radius: 20, y: 10)
    }
}


#Preview {
    CustomContextMenuView()
}
