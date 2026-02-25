//

import SwiftUI

struct ScrollViewPreferenceKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero
    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {}
}

struct ScrollViewOffsetTracker: View {
    var body: some View {
        GeometryReader { geo in
            Color.clear
                .preference(
                    key: ScrollViewPreferenceKey.self,
                    value: geo.frame(in: .named("scroll")).origin
                )
        }
    }
}

#Preview {
    ScrollViewOffsetTracker()
}
