import SwiftUI

struct AppetizerTabView: View {
    @EnvironmentObject var order66: Order
    var body: some View {
        TabView {
            AppetizersListView()
                .tabItem { Label("house", image: "Home")
//                    Image(systemName: "house")
//                    Text("Home")
                }
            
            AccountView()
                .tabItem { Label("person", image: "Account") }
            
            OrderView()
                .tabItem { Label("bag", image: "Order") }
                .badge(order66.items.count)
        }
        .tint(.brandColor)
    }
};

#Preview {
    AppetizerTabView()
}
