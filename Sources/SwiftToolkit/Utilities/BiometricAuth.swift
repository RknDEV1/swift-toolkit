import Foundation
import LocalAuthentication

/// Simple biometric authentication helper (Face ID / Touch ID / Optic ID).
///
/// Use this to protect sensitive actions or gate access to Keychain items.
@available(iOS 15.0, macOS 13.0, *)
public enum BiometricAuth {

    public enum BiometricError: Error, LocalizedError {
        case notAvailable
        case notEnrolled
        case cancelled
        case failed
        case unknown(Error)

        public var errorDescription: String? {
            switch self {
            case .notAvailable: return "Biometria não disponível neste dispositivo"
            case .notEnrolled: return "Nenhuma biometria cadastrada"
            case .cancelled: return "Autenticação cancelada"
            case .failed: return "Falha na autenticação biométrica"
            case .unknown(let error): return error.localizedDescription
            }
        }
    }

    /// Returns the available biometric type on the current device.
    public static var availableType: LABiometryType {
        let context = LAContext()
        var error: NSError?
        guard context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
            return .none
        }
        return context.biometryType
    }

    /// Human-readable name of the biometric type.
    public static var typeName: String {
        switch availableType {
        case .faceID: return "Face ID"
        case .touchID: return "Touch ID"
        case .opticID: return "Optic ID"
        default: return "Biometria"
        }
    }

    /// Whether biometrics can be used right now.
    public static var isAvailable: Bool {
        let context = LAContext()
        var error: NSError?
        return context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
    }

    /// Authenticates the user with biometrics (or device passcode as fallback).
    ///
    /// - Parameter reason: Message shown to the user (required by the system).
    /// - Returns: `true` if authentication succeeded.
    public static func authenticate(reason: String) async throws -> Bool {
        let context = LAContext()
        context.localizedFallbackTitle = "Usar senha"

        var error: NSError?
        guard context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
            if let laError = error as? LAError {
                throw map(laError)
            }
            throw BiometricError.notAvailable
        }

        do {
            return try await context.evaluatePolicy(
                .deviceOwnerAuthenticationWithBiometrics,
                localizedReason: reason
            )
        } catch let laError as LAError {
            throw map(laError)
        } catch {
            throw BiometricError.unknown(error)
        }
    }

    /// Authenticates with biometrics or device passcode.
    public static func authenticateWithPasscodeFallback(reason: String) async throws -> Bool {
        let context = LAContext()

        var error: NSError?
        guard context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) else {
            throw BiometricError.notAvailable
        }

        do {
            return try await context.evaluatePolicy(
                .deviceOwnerAuthentication,
                localizedReason: reason
            )
        } catch let laError as LAError {
            throw map(laError)
        } catch {
            throw BiometricError.unknown(error)
        }
    }

    private static func map(_ error: LAError) -> BiometricError {
        switch error.code {
        case .biometryNotAvailable:
            return .notAvailable
        case .biometryNotEnrolled:
            return .notEnrolled
        case .userCancel, .systemCancel, .appCancel:
            return .cancelled
        case .authenticationFailed:
            return .failed
        default:
            return .unknown(error)
        }
    }
}
