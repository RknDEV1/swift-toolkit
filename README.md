# Swift Toolkit

A clean and focused collection of reusable **Swift** and **SwiftUI** utilities for native iOS development.

[![CI](https://github.com/RknDEV1/swift-toolkit/actions/workflows/ci.yml/badge.svg)](https://github.com/RknDEV1/swift-toolkit/actions/workflows/ci.yml)
[![Swift](https://img.shields.io/badge/Swift-5.9+-orange.svg)](https://swift.org)
[![Platform](https://img.shields.io/badge/Platform-iOS%2017%2B%20%7C%20macOS%2014%2B-blue.svg)](https://developer.apple.com)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

> Also available in Portuguese: [README.pt-BR.md](README.pt-BR.md)

---

## Features

| Category | Utilities |
|----------|-----------|
| **Storage** | Secure Keychain helper, Type-safe UserDefaults |
| **Validation** | Email and Brazilian CPF validators |
| **Formatting** | Currency (BRL), numbers, dates (pt-BR) |
| **Networking** | Lightweight async/await network client |
| **Feedback** | Haptic feedback helpers (iOS only) |
| **SwiftUI** | LoadingView, EmptyStateView, View extensions |
| **Extensions** | String, Optional, Date helpers |

---

## Requirements

- iOS 17.0+
- macOS 14.0+
- Swift 5.9+
- Xcode 15+

---

## Installation

### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/RknDEV1/swift-toolkit.git", from: "0.1.0")
]
```

Or in Xcode:

1. Go to **File → Add Package Dependencies…**
2. Paste `https://github.com/RknDEV1/swift-toolkit.git`
3. Select the version and add the package

---

## Usage

### String Extensions

```swift
"  hello  ".trimmed          // "hello"
"".isBlank                   // true
```

### Keychain

```swift
try KeychainHelper.save("secret-token", forKey: "authToken")
let token = try KeychainHelper.load(forKey: "authToken")
try KeychainHelper.delete(forKey: "authToken")
```

### Type-safe UserDefaults

```swift
struct Settings: Codable {
    var theme: String
}

let defaults = TypedUserDefaults()
defaults.set(Settings(theme: "dark"), forKey: "settings")
let settings: Settings? = defaults.value(forKey: "settings")
```

### Validators

```swift
Validator.isValidEmail("user@example.com")
Validator.isValidCPF("390.533.447-05")
```

### Formatters

```swift
Formatters.currency(19.90)                 // "R$ 19,90"
Formatters.currency(fromCentavos: 1990)    // "R$ 19,90"
Date().formatted()
Date().relativeFormatted()
```

### Haptics (iOS only)

```swift
Haptic.success()
Haptic.light()
Haptic.error()
```

### Network Client

```swift
let client = NetworkClient()
let user: User = try await client.get("https://api.example.com/user/1")
```

### SwiftUI Components

```swift
LoadingView(message: "Loading...")
EmptyStateView(title: "No items", systemImage: "tray")
```

---

## Project Structure

```
Sources/SwiftToolkit/
├── Extensions/
├── Utilities/
└── Components/
```

---

## Changelog

See [CHANGELOG.md](CHANGELOG.md).

## License

MIT License. See [LICENSE](LICENSE).
