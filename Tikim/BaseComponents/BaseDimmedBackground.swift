//
//  BaseDimmedBackground.swift
//  Tikim
//
//  Created by Rashad on 08.05.26.
//

import SwiftUI

struct BaseDimmedBackground: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.3)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    BaseDimmedBackground()
}
