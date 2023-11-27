import SwiftUI

struct EmptyState: View {
    
    let imageName: String
    let message: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea(.all)
            
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 200)
                
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding(50)
            }
            .offset(y: -35)
        }
    }
}

#Preview {
    EmptyState(imageName: "empty-order", message: "Default")
}
