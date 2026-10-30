# Swift Toolkit

A clean and focused collection of reusable **Swift** and **SwiftUI** utilities for native iOS development.

[![CI](https://github.com/RknDEV1/swift-toolkit/actions/workflows/ci.yml/badge.svg)](https://github.com/RknDEV1/swift-toolkit/actions/workflows/ci.yml)
[![Swift](https://img.shields.io/badge/Swift-5.9+-orange.svg)](https://swift.org)
[![Platform](https://img.shields.io/badge/Platform-iOS%2017%2B%20%7C%20macOS%2014%2B-blue.svg)](https://developer.apple.com)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

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

Add the dependency in your `Package.swift`:

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
"   ".isBlank                // true
```

### Optional String

```swift
let value: String? = nil
value.isNilOrBlank           // true
```

### Keychain

```swift
try KeychainHelper.save("secret-token", forKey: "authToken")

let token = try KeychainHelper.load(forKey: "authToken")
try KeychainHelper.delete(forKey: "authToken")

if KeychainHelper.exists(forKey: "authToken") {
    // ...
}
```

### Type-safe UserDefaults

```swift
struct Settings: Codable {
    var theme: String
    var notificationsEnabled: Bool
}

let defaults = TypedUserDefaults()

defaults.set(Settings(theme: "dark", notificationsEnabled: true), forKey: "settings")

if let settings: Settings = defaults.value(forKey: "settings") {
    print(settings.theme)
}

defaults.remove(forKey: "settings")
```

### Validators

```swift
Validator.isValidEmail("user@example.com")     // true
Validator.isValidEmail("invalid-email")        // false

Validator.isValidCPF("390.533.447-05")         // true
Validator.isValidCPF("00000000000")            // false
```

### Formatters

```swift
Formatters.currency(19.90)                     // "R$ 19,90"
Formatters.currency(fromCentavos: 1990)        // "R$ 19,90"
Formatters.number(1234.5, fractionDigits: 2)   // "1.234,50"
```

### Date Helpers

```swift
Date().formatted()                             // medium date + short time (pt-BR)
Date().relativeFormatted()                     // "há 2 horas"
Date().isToday                                 // true/false
Date().startOfDay                              // beginning of the day
```

### Haptics (iOS only)

```swift
Haptic.light()
Haptic.medium()
Haptic.heavy()
Haptic.success()
Haptic.warning()
Haptic.error()
Haptic.selection()
```

### Network Client

```swift
struct User: Decodable {
    let id: Int
    let name: String
}

let client = NetworkClient()
let user: User = try await client.get("https://api.example.com/user/1")
```

### SwiftUI Components

```swift
LoadingView(message: "Loading...")

EmptyStateView(
    title: "No items",
    systemImage: "tray",
    description: "Add something to get started."
)
```

### View Extensions

```swift
SomeView()
    .if(isEnabled) { view in
        view.opacity(1)
    }
    .isHidden(shouldHide)
```

---

## Project Structure

```
Sources/SwiftToolkit/
├── Extensions/
│   ├── String+Extensions.swift
│   ├── Optional+Extensions.swift
│   ├── Date+Extensions.swift
│   └── View+Extensions.swift
├── Utilities/
│   ├── KeychainHelper.swift
│   ├── UserDefaults+Typed.swift
│   ├── Validator.swift
│   ├── Formatters.swift
│   ├── Haptic.swift
│   └── NetworkClient.swift
└── Components/
    ├── LoadingView.swift
    └── EmptyStateView.swift
```

---

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for release history.

---

## License

This project is released under the **MIT License**. See [LICENSE](LICENSE) for details.

---

## Contributing

Contributions are welcome. Feel free to open issues or submit pull requests.
