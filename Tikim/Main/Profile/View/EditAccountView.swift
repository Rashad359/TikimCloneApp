//
//  EditAccountView.swift
//  Tikim
//
//  Created by Rashad on 01.04.26.
//

import SwiftUI

struct EditAccountView: View {
    @State private var fullName: String = ""
    @State private var email: String = ""
    @State private var phoneNumber: String = ""
    let removeCharacters: Set<Character> = ["(", ")", "-", " "]
    
    @FocusState var keyboardsFocused: Bool
    
    @AppStorage("presentMain") var userLoggedIn: Bool = false
    
    @AppStorage("logout") var logout = false
    
    var body: some View {
        
        ZStack {
            
            if userLoggedIn {
                Color.baseBackground
                    .ignoresSafeArea()
                
                VStack(spacing: 16) {
                    
                    inputInfo
                    
                    deleteAccount
                    
                    Spacer()
                }
            } else {
                VStack(spacing: 32) {
                    Image("boxImage")
                    
                    VStack(spacing: 24) {
                        VStack(spacing: 8) {
                            Text("Hesab açın, rahat sifariş verin")
                                .bold()
                            
                            Text("Davam etmək üçün zəhmət olmasa daxil olun")
                                .multilineTextAlignment(.center)
                                .foregroundStyle(Color.gray)
                        }
                        
                        BaseButton(text: "Əlavə et") {
                            logout = true
                        }
                    }
                }
                .padding(.horizontal, 32)
            }
        }
        .navigationTitle("Edit profile")
    }
}

#Preview {
    EditAccountView()
}

extension EditAccountView {
    private var inputInfo: some View {
        VStack(alignment: .leading, spacing: 16) {
                ProfileField(
                    title: "Ad, Soyad",
                    leftIcon: "userLine",
                    text: $fullName,
                    focused: _keyboardsFocused
                )
                
                ProfileField(
                    title: "E-mail",
                    leftIcon: "mail",
                    text: $email,
                    focused: _keyboardsFocused
                )
                
            PhoneField(
                phoneNumber: $phoneNumber,
                focused: _keyboardsFocused
            )
                
                BaseButton(text: "Save Changes") {
                    phoneNumber.removeAll(where: {removeCharacters.contains($0)})
                    
                    keyboardsFocused = false
                }
                .padding(.top, 8)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
        )
        .padding(.horizontal, 16)
    }
    
    private var deleteAccount: some View {
        HStack {
            Image("trash")
            
            Text("Hesabi sil")
                .foregroundStyle(Color.gray)
            
            Spacer()
        }
        .padding(.horizontal, 16)
    }
}
