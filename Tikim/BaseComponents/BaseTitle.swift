//

import SwiftUI

struct BaseTitle: View {
    let title: String
    let buttonAction: (() -> ())?
    
    var body: some View {
        HStack() {
            Text(title)
                .font(.system(size: 18))
                .fontWeight(.medium)
            
            Spacer()

            Button {
                buttonAction?()
            } label: {
                HStack(spacing: 4) {
                    Text("See all")
                    
                    Image(.arrowRight)
                }
                .foregroundStyle(.baseBlue)
            }
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    BaseTitle(title: "Endirimli mehsullar", buttonAction: nil)
}
