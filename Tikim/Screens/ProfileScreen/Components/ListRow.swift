//

import SwiftUI

struct ListRow: View {
    let item: ProfileModel.Item
    var textColor: Color
    var onTap: (() -> ())?
    
    var body: some View {
        Button {
            onTap?()
        } label: {
            HStack {
                Image(item.image)
                
                Text(item.title)
            }
            .foregroundStyle(textColor)
        }
    }
}

#Preview {
    ListRow(item: .init(image: .userLine, title: "Something"), textColor: .black)
}
