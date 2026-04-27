//
//  RootView.swift
//  Tikim
//
//  Created by Rashad on 22.04.26.
//

import SwiftUI

struct RootView: View {
    @AppStorage("presentMain") private var userLoggedIn = false
    @AppStorage("logout") private var logout = false
    @AppStorage("userEntered") private var userEntered = false
    @AppStorage("language") private var language = "en"
    
    @State private var logState: LogState
    
    init() {
        let userEntered = UserDefaults.standard.bool(forKey: "userEntered")
        
        if userEntered {
            _logState = State(initialValue: .main)
        }
         else {
            _logState = State(initialValue: .onboarding)
        }
    }
    
    
    var body: some View {
        ZStack {
            switch logState {
            case .main:
                NavigationStack {
                    MainView()
                        .ignoresSafeArea(.keyboard)
                }
                .transition(
                    .asymmetric(
                        insertion: .move(edge: .trailing),
                        removal: .move(edge: .trailing)
                    )
                )
                .zIndex(1)
            case .login:
                NavigationStack {
                    LoginView()
                }
                .transition(
                    .asymmetric(
                        insertion: .move(edge: .leading),
                        removal: .move(edge: .leading)
                    )
                )
                .zIndex(2)
            case .onboarding:
                NavigationStack {
                    OnboardingView()
                }
                .zIndex(0)
            }
        }
        .environment(\.locale, Locale(identifier: language))
        .animation(.easeInOut(duration: 0.2), value: logState)
        .preferredColorScheme(.light)
        .onChange(of: logout) { _, _ in
            updateLogState()
        }
        .onChange(of: userLoggedIn) { _, _ in
            updateLogState()
        }
        .onChange(of: userEntered, { _, _ in
                updateLogState()
        })
        .onAppear {
            print("User logged in: \(userLoggedIn)")
            print("Logout: \(logout)")
            if userLoggedIn {
                logout = true
            } else {
                logout = false
            }
        }
    }
    
    private func updateLogState() {
        if userLoggedIn {
            logState = .main
        } else if logout {
            logState = .login
        } else {
            logState = .main
        }
    }
}

#Preview {
    RootView()
}
