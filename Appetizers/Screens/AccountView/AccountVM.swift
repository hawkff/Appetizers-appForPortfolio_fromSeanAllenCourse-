import SwiftUI

final class AccountVM : ObservableObject {
    
    
    @AppStorage ("usser") private var userData: Data?
    @Published var usser = User()
    @Published var alertItem: AlertItem?
    
    
    var isValidForm: Bool {
        guard !usser.firstName.isEmpty && !usser.lastName.isEmpty && !usser.eMail.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard usser.eMail.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        return true
    }
    
    func saveChanges(){
        guard isValidForm else { return }
        
        do {
            let data = try JSONEncoder().encode(usser)
            userData = data
            alertItem = AlertContext.userSaveSuccess
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    func retrieveUser() {
        guard let userData = userData else { return }
        do {
            let usser = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
};
