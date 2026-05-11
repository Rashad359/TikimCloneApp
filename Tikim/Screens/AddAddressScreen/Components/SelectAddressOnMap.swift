//
//  SelectAddressOnMap.swift
//  Tikim
//
//  Created by Rashad on 08.05.26.
//

import SwiftUI

struct SelectAddressOnMap: View {
    var body: some View {
        HStack {
            Image("mapIcon")
            
            VStack(alignment: .leading) {
                Text("Adresinizi tapa bilmirsiz?")
                
                Text("Xeriteden axtarin")
            }
            
            Spacer()
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 8)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.baseBackground)
        )
        .padding(.horizontal, 16)
    }
}

#Preview {
    SelectAddressOnMap()
}
