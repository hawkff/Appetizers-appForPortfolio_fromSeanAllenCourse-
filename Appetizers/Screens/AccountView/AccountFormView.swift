import SwiftUI

struct AccountFormView: View {
    @ObservedObject var vm: AccountVM
    @FocusState private var focusedTextField: FormTextField?

    enum FormTextField {
        case firstName, lastName, eMail
    }

    var body: some View {
        Form {
            Section(header: Text("Personal Info")) {
                TextField("First Name", text: $vm.usser.firstName)
                    .focused($focusedTextField, equals: .firstName)
                    .onSubmit { focusedTextField = .lastName }
                    .submitLabel(.next)

                TextField("Last Name", text: $vm.usser.lastName)
                    .focused($focusedTextField, equals: .lastName)
                    .onSubmit { focusedTextField = .eMail }
                    .submitLabel(.next)

                TextField("Email", text: $vm.usser.eMail)
                    .focused($focusedTextField, equals: .eMail)
                    .onSubmit { focusedTextField = nil }
                    .submitLabel(.continue)

                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                DatePicker("Birthday", selection: $vm.usser.birthDate, displayedComponents: .date)

                Button("Save Changes") {
                    vm.saveChanges()
                }
            }

            Section(header: Text("Requests")) {
                Toggle("Extra Napkins", isOn: $vm.usser.extraNapkins)
                Toggle("Frequent Refills", isOn: $vm.usser.frequentRefills)
            }
            .toggleStyle(SwitchToggleStyle(tint: .brandColor))
        }
    }
}
