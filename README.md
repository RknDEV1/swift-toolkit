# Swift Toolkit

A clean and focused collection of reusable **Swift** and **SwiftUI** utilities for native iOS development.

[![CI](https://github.com/RknDEV1/swift-toolkit/actions/workflows/ci.yml/badge.svg)](https://github.com/RknDEV1/swift-toolkit/actions/workflows/ci.yml)

## Features

- String and Optional extensions
- Type-safe `UserDefaults`
- Secure Keychain helper
- Email and CPF validators
- Reusable SwiftUI components (`LoadingView`, `EmptyStateView`)
- Fully compatible with Swift Package Manager

## Requirements

- iOS 17+
- macOS 14+
- Swift 5.9+
- Xcode 15+

## Installation

### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/RknDEV1/swift-toolkit.git", from: "0.1.0")
]
```

Or add it directly in Xcode:

1. File → Add Package Dependencies…
2. Paste `https://github.com/RknDEV1/swift-toolkit.git`

## Usage Examples

### String Extensions

```swift
"  hello  ".trimmed          // "hello"
"".isBlank                   // true
```

### Keychain

```swift
try KeychainHelper.save("secret", forKey: "token")
let token = try KeychainHelper.load(forKey: "token")
try KeychainHelper.delete(forKey: "token")
```

### Typed UserDefaults

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
Validator.isValidEmail("user@example.com") // true
Validator.isValidCPF("12345678909")        // validates check digits
```

### SwiftUI Components

```swift
LoadingView(message: "Carregando...")

EmptyStateView(
    title: "Nenhum item",
    systemImage: "tray",
    description: "Adicione algo para começar."
)
```

## Project Structure

```
Sources/SwiftToolkit/
├── Extensions/
├── Utilities/
└── Components/
Tests/
└── SwiftToolkitTests/
```

## License

MIT License
