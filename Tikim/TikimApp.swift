//

import SwiftUI

@main
struct TikimApp: App {
    @AppStorage("presentMain") private var userLoggedIn = false
    @AppStorage("logout") private var logout = false
    
    @AppStorage("language") private var language = "en"
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if userLoggedIn {
                    MainView()
                        .transition(
                            .asymmetric(
                                insertion: .move(edge: .trailing),
                                removal: .move(edge: .trailing)
                            )
                        )
                } else {
                    if logout {
                        NavigationStack {
                            LoginView()
                        }
                    } else {
                        NavigationStack {
                            OnboardingView()
                        }
                    }
                }
            }
            .environment(\.locale, Locale(identifier: language))
            .animation(.easeInOut(duration: 0.2), value: userLoggedIn)
            .preferredColorScheme(.light)
            
        }
    }
}
