//

import SwiftUI

struct CustomNavBarBackButton: ViewModifier {
    @Environment(\.dismiss) var dismiss
    var show: Bool
    
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden()
            .toolbar {
                if #available(iOS 26.0, *) {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            HStack(spacing: 4) {
                                Image(.arrowLeftIcon)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                
                                Text("Back")
                                    .font(.system(size: 14))
                                    .fontWeight(.medium)
                            }
                            .opacity(show ? 1 : 0)
                            .foregroundStyle(.textSub)
                            .padding(.leading, -16)
                        }
                    }
                    .sharedBackgroundVisibility(.hidden)
                } else {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            HStack(spacing: 4) {
                                Image(.arrowLeftIcon)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                
                                Text("Back")
                                    .font(.system(size: 14))
                                    .fontWeight(.medium)
                            }
                            .foregroundStyle(.textSub)
                        }
                    }
                }
            }
    }
}


extension View {
    func withCustomBackButton(show: Bool) -> some View {
        self.modifier(CustomNavBarBackButton(show: show))
    }
}
