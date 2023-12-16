import SwiftUI

struct AccountView: View {
    @StateObject var vm = AccountVM()

    var body: some View {
        NavigationStack {
            AccountFormView(vm: vm)
                .navigationTitle("Account")
        }
        .onAppear {
            vm.retrieveUser()
        }
        .alert(item: $vm.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AccountView()
}
