import Foundation
import Security

/// Enhanced secure storage that combines Keychain with optional biometric protection.
///
/// Items can be stored so that reading them requires biometric authentication.
@available(iOS 15.0, macOS 13.0, *)
public enum SecureStorage {

    /// Saves a value that can only be read after biometric authentication.
    ///
    /// - Note: The item is protected with `kSecAttrAccessControl` requiring biometrics.
    public static func saveWithBiometrics(
        _ value: String,
        forKey key: String,
        service: String = "SwiftToolkit",
        prompt: String = "Autentique para acessar dados seguros"
    ) throws {
        guard let data = value.data(using: .utf8) else {
            throw KeychainHelper.KeychainError.invalidData
        }

        var error: Unmanaged<CFError>?
        guard let accessControl = SecAccessControlCreateWithFlags(
            nil,
            kSecAttrAccessibleWhenUnlockedThisDeviceOnly,
            .biometryCurrentSet,
            &error
        ) else {
            throw KeychainHelper.KeychainError.unexpectedStatus(errSecParam)
        }

        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: key
        ]

        SecItemDelete(query as CFDictionary)

        var attributes = query
        attributes[kSecValueData as String] = data
        attributes[kSecAttrAccessControl as String] = accessControl

        let status = SecItemAdd(attributes as CFDictionary, nil)
        guard status == errSecSuccess else {
            throw KeychainHelper.KeychainError.unexpectedStatus(status)
        }
    }

    /// Loads a biometric-protected value.
    /// The system will prompt the user for Face ID / Touch ID automatically.
    public static func loadWithBiometrics(
        forKey key: String,
        service: String = "SwiftToolkit",
        prompt: String = "Autentique para acessar dados seguros"
    ) throws -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: key,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecUseOperationPrompt as String: prompt
        ]

        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)

        if status == errSecItemNotFound {
            return nil
        }

        if status == errSecAuthFailed || status == errSecUserCanceled {
            throw BiometricAuth.BiometricError.cancelled
        }

        guard status == errSecSuccess else {
            throw KeychainHelper.KeychainError.unexpectedStatus(status)
        }

        guard let data = result as? Data,
              let value = String(data: data, encoding: .utf8) else {
            throw KeychainHelper.KeychainError.invalidData
        }

        return value
    }
}
