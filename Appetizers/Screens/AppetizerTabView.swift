import SwiftUI

struct AppetizerTabView: View {
    @EnvironmentObject var order66: Order
    var body: some View {
        TabView {
            AppetizersListView()
                .tabItem { Label("Home", systemImage: "house")
//                    Image(systemName: "house")
//                    Text("Home")
                }

            AccountView()
                .tabItem { Label("Account", systemImage: "person.circle.fill") }

            OrderView()
                .tabItem { Label("Order", systemImage: "basket.fill") }
                .badge(order66.items.count)
        }
        .tint(.brandColor)
    }
}

#Preview {
    AppetizerTabView()
}
