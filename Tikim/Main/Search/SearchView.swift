//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            CustomSearchBar(text: $searchText)
            
            Text("Searching \(searchText)")
            
            Spacer()
        }
    }
}
