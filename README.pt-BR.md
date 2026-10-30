# Swift Toolkit

Coleção limpa e focada de utilitários reutilizáveis em **Swift** e **SwiftUI** para desenvolvimento nativo iOS.

[![CI](https://github.com/RknDEV1/swift-toolkit/actions/workflows/ci.yml/badge.svg)](https://github.com/RknDEV1/swift-toolkit/actions/workflows/ci.yml)
[![Swift](https://img.shields.io/badge/Swift-5.9+-orange.svg)](https://swift.org)
[![Platform](https://img.shields.io/badge/Platform-iOS%2017%2B%20%7C%20macOS%2014%2B-blue.svg)](https://developer.apple.com)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

> Also available in English: [README.md](README.md)

---

## Funcionalidades

| Categoria | Utilitários |
|-----------|-------------|
| **Armazenamento** | Keychain seguro, UserDefaults tipado |
| **Validação** | E-mail e CPF |
| **Formatação** | Moeda (R$), números e datas (pt-BR) |
| **Rede** | Cliente de rede leve com async/await |
| **Feedback** | Haptics (somente iOS) |
| **SwiftUI** | LoadingView, EmptyStateView, extensões de View |
| **Extensões** | String, Optional, Date |

---

## Requisitos

- iOS 17.0+
- macOS 14.0+
- Swift 5.9+
- Xcode 15+

---

## Instalação

### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/RknDEV1/swift-toolkit.git", from: "0.1.0")
]
```

Ou no Xcode:

1. **File → Add Package Dependencies…**
2. Cole `https://github.com/RknDEV1/swift-toolkit.git`
3. Adicione o pacote ao target

---

## Exemplos de Uso

### Extensões de String

```swift
"  hello  ".trimmed          // "hello"
"".isBlank                   // true
```

### Keychain

```swift
try KeychainHelper.save("token-secreto", forKey: "authToken")
let token = try KeychainHelper.load(forKey: "authToken")
try KeychainHelper.delete(forKey: "authToken")
```

### UserDefaults Tipado

```swift
struct Settings: Codable {
    var theme: String
}

let defaults = TypedUserDefaults()
defaults.set(Settings(theme: "dark"), forKey: "settings")
let settings: Settings? = defaults.value(forKey: "settings")
```

### Validadores

```swift
Validator.isValidEmail("user@example.com")
Validator.isValidCPF("390.533.447-05")
```

### Formatadores

```swift
Formatters.currency(19.90)                 // "R$ 19,90"
Formatters.currency(fromCentavos: 1990)    // "R$ 19,90"
Date().formatted()
Date().relativeFormatted()                 // "há 2 horas"
```

### Haptics (somente iOS)

```swift
Haptic.success()
Haptic.light()
Haptic.error()
```

### Cliente de Rede

```swift
let client = NetworkClient()
let user: User = try await client.get("https://api.example.com/user/1")
```

### Componentes SwiftUI

```swift
LoadingView(message: "Carregando...")
EmptyStateView(title: "Nada por aqui", systemImage: "tray")
```

---

## Estrutura do Projeto

```
Sources/SwiftToolkit/
├── Extensions/
├── Utilities/
└── Components/
```

---

## Changelog

Veja [CHANGELOG.md](CHANGELOG.md).

## Licença

MIT License. Veja [LICENSE](LICENSE).
