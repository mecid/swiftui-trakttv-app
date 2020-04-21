import Foundation

enum HTTPMethod: String {
    case put = "PUT"
    case post = "POST"
    case get = "GET"
    case delete = "DELETE"
    case head = "HEAD"
}

protocol Request {
    var scheme: String { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var host: String { get }
    var queryItems: [URLQueryItem] { get }
    var headers: [String: String] { get }
    var body: Data? { get }
}

extension Request {
    var method: HTTPMethod { return .get }
    var scheme: String { return "https" }
    var headers: [String: String] { return [:] }
    var host: String { return "api.trakt.tv" }
    var body: Data? { return nil }
}

extension Request {
    func build() -> URLRequest {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = queryItems

        guard let url = components.url else {
            preconditionFailure("Invalid url components")
        }

        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        request.httpMethod = method.rawValue
        request.httpBody = body
        return request
    }
}
