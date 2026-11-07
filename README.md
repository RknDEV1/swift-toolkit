# Swift Toolkit

Reusable **Swift** utilities for native iOS apps.

[![CI](https://github.com/RknDEV1/swift-toolkit/actions/workflows/ci.yml/badge.svg)](https://github.com/RknDEV1/swift-toolkit/actions/workflows/ci.yml)
[![Swift](https://img.shields.io/badge/Swift-5.9+-orange.svg)](https://swift.org)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

> Portuguese: [README.pt-BR.md](README.pt-BR.md)

Part of the [RknDEV1](https://github.com/RknDEV1) toolkit stack.

## Features

| Area | APIs |
|------|------|
| **Secure Storage** | Keychain, biometric-protected Keychain |
| **Biometrics** | Face ID / Touch ID authentication |
| Validation | Email, Brazilian CPF |
| Formatting | BRL currency, numbers, dates (pt-BR) |
| Network | Lightweight async client |
| Helpers | Debouncer, safe array index, Bundle version |
| SwiftUI | LoadingView, EmptyStateView |
| Feedback | Haptics (iOS) |

## Install

```swift
.package(url: "https://github.com/RknDEV1/swift-toolkit.git", branch: "main")
```

## Usage — Biometrics + Secure Storage

```swift
// Check availability
if BiometricAuth.isAvailable {
    print("Usando \(BiometricAuth.typeName)")
}

// Authenticate
let success = try await BiometricAuth.authenticate(
    reason: "Confirme sua identidade para continuar"
)

// Store with biometric protection
try SecureStorage.saveWithBiometrics("token-secreto", forKey: "auth")

// Read (system prompts Face ID / Touch ID)
let token = try SecureStorage.loadWithBiometrics(forKey: "auth")
```

## License

MIT
