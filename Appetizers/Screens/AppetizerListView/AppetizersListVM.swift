import SwiftUI

@MainActor final class AppetizersListVM: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?

//    func getAppetizers() {
//        isLoading = true
//        let queue = DispatchQueue.main
//        NetworkManager.shared.getAppetizers { [self] result in
//            queue.async { [self] in
//                isLoading = false
//                switch result {
//                case .success(let appetizers):
//                    self.appetizers = appetizers
//                case .failure(let error):
//                    switch error {
//
//                    case .invalidURL:
//                        alertItem = AlertContext.invalidURL
//                    case .invalidResponse:
//                        alertItem = AlertContext.invalidResponse
//                    case .invalidData:
//                        alertItem = AlertContext.invalidData
//                    case .unableToComplete:
//                        alertItem = AlertContext.unableToComplete
//                    }
//                }
//            }
//        }
//    }
    func getAppetizers() {
        isLoading = true

        Task {
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            } catch {
                print("An error occurred: \(error.localizedDescription)")
                isLoading = false
            }
        }
    }
}
