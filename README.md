# Swift Toolkit

A clean collection of reusable **Swift** and **SwiftUI** utilities for native iOS apps.

[![CI](https://github.com/RknDEV1/swift-toolkit/actions/workflows/ci.yml/badge.svg)](https://github.com/RknDEV1/swift-toolkit/actions/workflows/ci.yml)
[![Swift](https://img.shields.io/badge/Swift-5.9+-orange.svg)](https://swift.org)
[![Platform](https://img.shields.io/badge/Platform-iOS%2017%2B%20%7C%20macOS%2014%2B-blue.svg)](https://developer.apple.com)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

> Portuguese: [README.pt-BR.md](README.pt-BR.md)

---

## Features

| Category | Utilities |
|----------|-----------|
| **Storage** | Keychain, type-safe UserDefaults |
| **Validation** | Email and Brazilian CPF |
| **Formatting** | Currency (BRL), numbers, dates (pt-BR) |
| **Networking** | Lightweight async/await client |
| **Feedback** | Haptics (iOS only) |
| **Helpers** | Debouncer, Bundle version, safe array index |
| **SwiftUI** | LoadingView, EmptyStateView, View extensions |

---

## Requirements

- iOS 17.0+
- macOS 14.0+
- Swift 5.9+
- Xcode 15+

---

## Installation

```swift
.package(url: "https://github.com/RknDEV1/swift-toolkit.git", branch: "main")
```

Or in Xcode: **File → Add Package Dependencies…** → paste the URL → branch **main**.

---

## Usage

```swift
Formatters.currency(19.90)
Date().brFormatted()
Validator.isValidEmail("user@example.com")

try KeychainHelper.save("token", forKey: "auth")

let debouncer = Debouncer(delay: 0.4)
debouncer.schedule { /* delayed work */ }

let value = items[safe: 2]
Bundle.main.versionLabel

LoadingView(message: "Loading...")
EmptyStateView(title: "No data", systemImage: "tray")
```

---

## Structure

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

MIT — see [LICENSE](LICENSE).
