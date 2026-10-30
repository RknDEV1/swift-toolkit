import Foundation

/// Lightweight network client based on URLSession.
public actor NetworkClient {

    public enum NetworkError: Error, LocalizedError {
        case invalidURL
        case invalidResponse
        case statusCode(Int)
        case decoding(Error)

        public var errorDescription: String? {
            switch self {
            case .invalidURL: return "URL inválida"
            case .invalidResponse: return "Resposta inválida"
            case .statusCode(let code): return "Erro HTTP \(code)"
            case .decoding(let error): return "Falha ao decodificar: \(error.localizedDescription)"
            }
        }
    }

    private let session: URLSession
    private let decoder: JSONDecoder

    public init(session: URLSession = .shared) {
        self.session = session
        self.decoder = JSONDecoder()
        self.decoder.keyDecodingStrategy = .convertFromSnakeCase
    }

    /// Performs a GET request and decodes the response.
    public func get<T: Decodable>(_ urlString: String) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }

        let (data, response) = try await session.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.statusCode(httpResponse.statusCode)
        }

        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw NetworkError.decoding(error)
        }
    }
}
