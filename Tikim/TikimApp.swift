//

import SwiftUI

@main
struct TikimApp: App {
    @AppStorage("presentMain") private var userLoggedIn = false
    @AppStorage("logout") private var logout = false
    @AppStorage("language") private var language = "en"
    
    @State private var logState: LogState
    
    init() {
        let loggedIn = UserDefaults.standard.bool(forKey: "presentMain")
        let loggedOut = UserDefaults.standard.bool(forKey: "logout")
        
        if loggedIn {
            _logState = State(initialValue: .main)
        } else if loggedOut {
            _logState = State(initialValue: .login)
        } else {
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
                    .transition( // <- Doesn't work. Fix it
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
            .onChange(of: userLoggedIn) { _, _ in updateLogState() }
            .onChange(of: logout) { _, _ in updateLogState() }
        }
    }
    
    private func updateLogState() {
        if userLoggedIn {
            logState = .main
        } else if logout {
            logState = .login
        } else {
            logState = .onboarding
        }
    }
}

enum LogState {
    case main
    case login
    case onboarding
}
