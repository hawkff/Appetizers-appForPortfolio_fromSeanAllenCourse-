import SwiftUI

struct OrderView: View {
//    @State private var order66 = MockData.order66
    @EnvironmentObject var order66: Order

    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    List {
                        ForEach(order66.items) { appetizer in
                            ApetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: { indexSet in
                            order66.items.remove(atOffsets: indexSet)
                        })
                    }
                    .listStyle(.grouped)

                    Button {} label: {
                        APButton(title: "$\(order66.totalPrice, specifier: "%.2f") - Place Order")
                    }
                    .padding(.bottom, 25)
                }

                if order66.items.isEmpty {
                    EmptyState(imageName: "empty-order", message: "Your order is empty")
                }
            }
            .navigationTitle("Order")
        }
    }
}

#Preview {
    OrderView()
}
