//
//  Options.swift
//  Tikim
//
//  Created by Rashad on 20.04.26.
//

import SwiftUI

struct Options: View {
    var item: OptionItem
    
    var body: some View {
        Text(item.text)
            .padding(.vertical, 12)
            .padding(.horizontal, 18)
            .foregroundStyle(item.isSelected ? Color.white : Color.black)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(item.isSelected ? Color.baseBlue : Color.clear)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.grayBorder, lineWidth: item.isSelected ? 0 : 1)
                    )
            )
    }
}

#Preview {
    Options(item: .init(text: "3 cores", isSelected: false))
}

struct OptionItem: Hashable {
    var text: String
    var isSelected: Bool
}
