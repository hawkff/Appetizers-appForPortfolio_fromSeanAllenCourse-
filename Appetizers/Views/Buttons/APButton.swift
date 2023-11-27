import SwiftUI

struct APButton: View {
    
    let title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundStyle(.white)
            .background(Color.brandColor)
            .clipShape(.rect(cornerRadius: 10, style: .continuous))
    }
};

#Preview {
    APButton(title: "Test Title")
}
