//
//  SettingsView.swift
//  Tikim
//
//  Created by Rashad on 01.04.26.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack {
            Color.baseBackground
                .ignoresSafeArea()
            
            VStack {
                Setting(leftImage: "markerPin", title: "Ünvanlar")
                
                Setting(leftImage: "azerbaijan", title: "Dil (Azərbaycanca)")
                
                Setting(leftImage: "blackBellIcon", title: "Push Bildirişlər", isRightSwitch: true)
                
                Spacer()
            }
            .padding(.horizontal, 16)
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    SettingsView()
}

struct Setting: View {
    
    var leftImage: String
    var title: String
    var isRightSwitch: Bool = false
    @State private var switchOn: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Image(leftImage)
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                    Text(title)
                }
                
                Spacer()
                
                if !isRightSwitch {
                    Image("arrowRight")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(.gray)
                } else {
                    ToggleSwitch(toggle: $switchOn)
    
                }
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 12)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .stroke(Color.strokeSub, lineWidth: 1)
        )
    }
}
