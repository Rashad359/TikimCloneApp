//

import SwiftUI

@main
struct TikimApp: App {
    
    var body: some Scene {
        WindowGroup {
//            MapView()
            RootView()
                .preferredColorScheme(.light)
        }
    }
}

enum LogState: Equatable {
    case main
    case login
    case onboarding
}
