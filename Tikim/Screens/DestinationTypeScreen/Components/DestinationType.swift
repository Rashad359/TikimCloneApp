//
//  DestinationType.swift
//  Tikim
//
//  Created by Rashad on 08.05.26.
//

import SwiftUI

struct DestinationType: View {
    var image: String
    var title: String
    var subtitle: String
    var action: (() -> ())?
    
    var body: some View {
        HStack(spacing: 12) {
            Image(image)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .fontWeight(.medium)
                
                Text(subtitle)
                    .font(.system(size: 12))
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
        }
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .shadow(color: Color.baseShadow, radius: 2, x: 0, y: 1)
        )
        .onTapGesture {
            action?()
        }
        
    }
}

#Preview {
    DestinationType(image: "building", title: "Ev", subtitle: "something")
}
