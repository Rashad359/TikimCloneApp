//

import SwiftUI

struct CustomSearchBar: View {
    @Binding var text: String
    @State private var isEditing = false
    @State private var disableTextField = false
    
    var body: some View {
        HStack {
            Image(.mainSearchIcon)
                .foregroundStyle(.gray)
                .padding(.leading, 8)
            
            TextField("Məhsul, mağaza və ya kateqoriya axtarın", text: $text, onEditingChanged: { editing in
                disableTextField = false
                isEditing = editing
            })
                .padding(.horizontal, 8)
                .disabled(disableTextField)
            
            if isEditing && !text.isEmpty {
                Button {
                    text = ""
                } label: {
                    Image(systemName: "multiply.circle.fill")
                        .foregroundStyle(.gray)
                        .padding(.trailing, 8)
                }
            }
            
            if isEditing {
                Button {
                    isEditing = false
                    disableTextField = true
                    text = ""
                } label: {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .animation(.easeInOut, value: isEditing)
                .transition(.move(edge: .trailing).combined(with: .opacity))
            }
        }
        .padding(7)
        .background(Color(.white))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.grayBorder), lineWidth: 1)
        )
        .padding(.horizontal, 10)
    }
}

#Preview {
    CustomSearchBar(text: .constant("something"))
}
