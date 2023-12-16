import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    func makeUIView(context _: Context) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = UIColor.brandColor
        activityIndicator.startAnimating()
        return activityIndicator
    }

    func updateUIView(_: UIActivityIndicatorView, context _: Context) {}
}

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea(.all)

            ActivityIndicator()
        }
    }
}
