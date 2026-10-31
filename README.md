# Swift Toolkit

Reusable **Swift** utilities for native iOS apps.

[![CI](https://github.com/RknDEV1/swift-toolkit/actions/workflows/ci.yml/badge.svg)](https://github.com/RknDEV1/swift-toolkit/actions/workflows/ci.yml)
[![Swift](https://img.shields.io/badge/Swift-5.9+-orange.svg)](https://swift.org)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

> Portuguese: [README.pt-BR.md](README.pt-BR.md)

Part of the [RknDEV1](https://github.com/RknDEV1) toolkit stack, used by [swift-ui-kit](https://github.com/RknDEV1/swift-ui-kit) demos and [aju-util](https://github.com/RknDEV1/aju-util).

## Features

| Area | APIs |
|------|------|
| Storage | Keychain, type-safe UserDefaults |
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

## Example

```swift
Formatters.currency(19.90)
Validator.isValidCPF("390.533.447-05")
try KeychainHelper.save("token", forKey: "auth")
let debouncer = Debouncer(delay: 0.4)
```

## License

MIT
