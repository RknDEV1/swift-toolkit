# Swift Toolkit

A clean and focused collection of reusable **Swift** and **SwiftUI** utilities for native iOS development.

[![CI](https://github.com/RknDEV1/swift-toolkit/actions/workflows/ci.yml/badge.svg)](https://github.com/RknDEV1/swift-toolkit/actions/workflows/ci.yml)

## Features

- String and Optional extensions
- Type-safe `UserDefaults`
- Secure Keychain helper
- Email and CPF validators
- Date and number formatters (pt-BR)
- Haptic feedback helpers
- Lightweight network client
- Reusable SwiftUI components and View extensions

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

## Usage Examples

### Formatters

```swift
Formatters.currency(19.90)                 // "R$ 19,90"
Formatters.currency(fromCentavos: 1990)    // "R$ 19,90"
Date().formatted()                         // data no padrão pt-BR
Date().relativeFormatted()                 // "há 2 horas"
```

### Haptics

```swift
Haptic.success()
Haptic.light()
Haptic.error()
```

### Network

```swift
let client = NetworkClient()
let data: MyModel = try await client.get("https://api.example.com/data")
```

### Keychain

```swift
try KeychainHelper.save("token", forKey: "auth")
let token = try KeychainHelper.load(forKey: "auth")
```

### SwiftUI

```swift
LoadingView(message: "Carregando...")
EmptyStateView(title: "Nada por aqui", systemImage: "tray")
```

## Structure

```
Sources/SwiftToolkit/
├── Extensions/
├── Utilities/
└── Components/
```

## License

MIT License
