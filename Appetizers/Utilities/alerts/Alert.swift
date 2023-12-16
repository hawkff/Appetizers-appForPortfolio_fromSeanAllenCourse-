import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

enum AlertContext {
    // MARK: - Network Alerts

    static let invalidURL = AlertItem(title: Text("Server Error"),
                                      message: Text("Maybe it's invalid link?"),
                                      dismissButton: .default(Text("OK")))
    static let invalidData = AlertItem(title: Text("Server Error"),
                                       message: Text("Corrupted Data"),
                                       dismissButton: .default(Text("OK")))
    static let invalidResponse = AlertItem(title: Text("Server Error"),
                                           message: Text("Try again later"),
                                           dismissButton: .default(Text("OK")))
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                            message: Text("Check the Intertet connection"),
                                            dismissButton: .default(Text("OK")))

    // MARK: - Account Alerts

    static let invalidForm = AlertItem(title: Text("Invalid form"),
                                       message: Text("Make sure all forms have been filled out"),
                                       dismissButton: .default(Text("OK")))
    static let invalidEmail = AlertItem(title: Text("Invalid email"),
                                        message: Text("Check your Email"),
                                        dismissButton: .default(Text("OK")))
    static let userSaveSuccess = AlertItem(title: Text("Profile Saved!"),
                                           message: Text("Successfully!"),
                                           dismissButton: .default(Text("OK")))
    static let invalidUserData = AlertItem(title: Text("Profile Error"),
                                           message: Text("Something went wrong"),
                                           dismissButton: .default(Text("OK")))
}
