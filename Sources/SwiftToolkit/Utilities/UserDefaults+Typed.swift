import Foundation

/// Type-safe wrapper around UserDefaults.
public final class TypedUserDefaults {

    private let defaults: UserDefaults

    public init(suiteName: String? = nil) {
        if let suiteName {
            self.defaults = UserDefaults(suiteName: suiteName) ?? .standard
        } else {
            self.defaults = .standard
        }
    }

    public func set<T: Codable>(_ value: T, forKey key: String) {
        if let data = try? JSONEncoder().encode(value) {
            defaults.set(data, forKey: key)
        }
    }

    public func value<T: Codable>(forKey key: String, as type: T.Type = T.self) -> T? {
        guard let data = defaults.data(forKey: key) else { return nil }
        return try? JSONDecoder().decode(T.self, from: data)
    }

    public func remove(forKey key: String) {
        defaults.removeObject(forKey: key)
    }
}
