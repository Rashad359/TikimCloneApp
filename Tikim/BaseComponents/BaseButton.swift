//

import SwiftUI

struct BaseButton: View {
    let text: String
    
    var isDisabled: Bool = false
    
    var textColor: Color = .white
    
    var backgroundColor: Color = .baseBlue
    
    var strokeColor: Color = .white
    
    var lineWidth: CGFloat = 0
    
    let action: (() -> ())?
    
    
    var body: some View {
        Button {
            action?()
        } label: {
            Text(text)
                .font(.headline)
                .frame(maxWidth: .infinity)
                .frame(height: 44)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(backgroundColor)
                        .stroke(strokeColor, style: .init(lineWidth: lineWidth))
                )
        }
        .foregroundStyle(textColor)
        .disabled(isDisabled)
    }
}

#Preview {
    BaseButton(text: "Hello", isDisabled: false, action: nil)
}
