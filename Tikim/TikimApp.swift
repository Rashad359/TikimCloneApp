//

import SwiftUI

@main
struct TikimApp: App {
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
    
    var body: some Scene {
        WindowGroup {
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
                case .onboarding:
                    NavigationStack {
                        OnboardingView()
                    }
                }
            }
            .environment(\.locale, Locale(identifier: language))
            .animation(.easeInOut(duration: 0.2), value: userLoggedIn)
            .preferredColorScheme(.light)
            .onChange(of: logout) { _, _ in
                updateLogState()
            }
            .onChange(of: userLoggedIn) { _, _ in
                updateLogState()
            }
            .onAppear {
                if userLoggedIn {
                    logout = true
                } else {
                    logout = false
                }
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

enum LogState {
    case main
    case login
    case onboarding
}
