//
//  NotificationView.swift
//  Tikim
//
//  Created by Rashad on 22.04.26.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("You have logged out!")
                    .foregroundStyle(.white)
                
                Spacer()
            }
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.green)
            )
            .padding(.horizontal, 12)
            
            Spacer()
                .frame(maxWidth: .infinity)
        }
        .background(Color.clear)
    }
}

#Preview {
    NotificationView()
}
