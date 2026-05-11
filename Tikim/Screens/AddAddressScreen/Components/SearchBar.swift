//
//  SearchBar.swift
//  Tikim
//
//  Created by Rashad on 08.05.26.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    @FocusState var searchFocuded: Bool
    
    var body: some View {
        HStack {
            Image("mainSearchIcon")
            
            TextField("Adresinizi axtarin", text: $searchText)
                .focused($searchFocuded)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 14)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .stroke(Color.gray, lineWidth: 1)
        )
        .padding(.horizontal, 16)
    }
}

#Preview {
    SearchBar(searchText: .constant("hello"))
}
