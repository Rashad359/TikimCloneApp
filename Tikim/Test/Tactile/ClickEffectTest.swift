//
//  ClikcEffect.swift
//  Tikim
//
//  Created by Rashad on 12.05.26.
//

import SwiftUI

struct ClickEffectTest: View {
    @State private var scale: Double = 1
    
    var body: some View {
        VStack {
            Text("Hello world")
        }
        .frame(width: 200, height: 200)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.red)
        )
        .scaleEffect(scale)
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged { value in
                    withAnimation(.easeInOut(duration: 0.3)) {
                        scale = 0.9
                    }
                }
                .onEnded { value in
                    withAnimation(.easeInOut(duration: 0.5)) {
                        scale = 1
                    }
                }
        )
    }
}

#Preview {
    ClickEffectTest()
}
