import Foundation

/// Type-safe wrapper around `UserDefaults` using `Codable`.
public final class TypedUserDefaults {

    private let defaults: UserDefaults
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    public init(suiteName: String? = nil) {
        if let suiteName, let suite = UserDefaults(suiteName: suiteName) {
            self.defaults = suite
        } else {
            self.defaults = .standard
        }
    }

    /// Stores a `Codable` value.
    @discardableResult
    public func set<T: Codable>(_ value: T, forKey key: String) -> Bool {
        do {
            let data = try encoder.encode(value)
            defaults.set(data, forKey: key)
            return true
        } catch {
            return false
        }
    }

    /// Retrieves a `Codable` value.
    public func value<T: Codable>(forKey key: String) -> T? {
        guard let data = defaults.data(forKey: key) else { return nil }
        return try? decoder.decode(T.self, from: data)
    }

    /// Removes the value for the given key.
    public func remove(forKey key: String) {
        defaults.removeObject(forKey: key)
    }

    /// Returns true if a value exists for the key.
    public func contains(key: String) -> Bool {
        defaults.object(forKey: key) != nil
    }
}
