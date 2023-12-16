import UIKit

final class NetworkManager {
    public static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()

    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizersURL = baseURL + "appetizers"

    private init() {}

    enum APError: Error {
        case invalidURL
        case invalidResponse
        case invalidData
        case unableToComplete
    }

//    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
//        guard let url = URL(string: appetizersURL) else {
//            completed(.failure(.invalidURL))
//            return
//        }
//
//        let request = URLRequest(url: url)
//        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
//            if let _ = error {
//                completed(.failure(.unableToComplete))
//                return
//            }
//
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                completed(.failure(.invalidResponse))
//                return
//            }
//
//            guard let data = data else {
//                completed(.failure(.invalidData))
//                return
//            }
//
//            let decoder = JSONDecoder()
//            do {
//                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
//                completed(.success(decodedResponse.request))
//            } catch {
//                print("An error occurred: \(error.localizedDescription)")
//            }
//        }
//        dataTask.resume()
//    }

    func getAppetizers() async throws -> [Appetizer] {
        guard let url = URL(string: appetizersURL) else {
            throw APError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)

//        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//
//        }

        let decoder = JSONDecoder()
        do {
            let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
            return decodedResponse.request
        } catch {
            throw APError.invalidData
        }
    }

    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)

        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }

        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }

        let request = URLRequest(url: url)
        let dataTask = URLSession.shared.dataTask(with: request) { data, _, _ in
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }

            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        dataTask.resume()
    }
}
