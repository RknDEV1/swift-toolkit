import Foundation
import Security

/// Simple and safe Keychain helper for storing small sensitive values.
///
/// Uses `kSecAttrAccessibleWhenUnlockedThisDeviceOnly` by default.
public enum KeychainHelper {

    public enum KeychainError: Error, LocalizedError {
        case unexpectedStatus(OSStatus)
        case invalidData

        public var errorDescription: String? {
            switch self {
            case .unexpectedStatus(let status):
                return "Keychain error: \(status)"
            case .invalidData:
                return "Invalid data"
            }
        }
    }

    /// Saves a string value to the Keychain.
    /// - Parameters:
    ///   - value: The string to store.
    ///   - key: Account key.
    ///   - service: Service identifier (default: "SwiftToolkit").
    public static func save(
        _ value: String,
        forKey key: String,
        service: String = "SwiftToolkit"
    ) throws {
        guard let data = value.data(using: .utf8) else {
            throw KeychainError.invalidData
        }

        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: key
        ]

        // Remove existing item first (idempotent)
        SecItemDelete(query as CFDictionary)

        var attributes = query
        attributes[kSecValueData as String] = data
        attributes[kSecAttrAccessible as String] = kSecAttrAccessibleWhenUnlockedThisDeviceOnly

        let status = SecItemAdd(attributes as CFDictionary, nil)
        guard status == errSecSuccess else {
            throw KeychainError.unexpectedStatus(status)
        }
    }

    /// Loads a string value from the Keychain.
    /// - Returns: The stored string, or `nil` if not found.
    public static func load(
        forKey key: String,
        service: String = "SwiftToolkit"
    ) throws -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: key,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]

        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)

        if status == errSecItemNotFound {
            return nil
        }

        guard status == errSecSuccess else {
            throw KeychainError.unexpectedStatus(status)
        }

        guard let data = result as? Data,
              let value = String(data: data, encoding: .utf8) else {
            throw KeychainError.invalidData
        }

        return value
    }

    /// Deletes a value from the Keychain.
    public static func delete(
        forKey key: String,
        service: String = "SwiftToolkit"
    ) throws {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: key
        ]

        let status = SecItemDelete(query as CFDictionary)
        guard status == errSecSuccess || status == errSecItemNotFound else {
            throw KeychainError.unexpectedStatus(status)
        }
    }

    /// Convenience: returns true if a value exists for the given key.
    public static func exists(
        forKey key: String,
        service: String = "SwiftToolkit"
    ) -> Bool {
        (try? load(forKey: key, service: service)) != nil
    }
}
