# Swift Toolkit

Coleção limpa e focada de utilitários reutilizáveis em **Swift** e **SwiftUI** para desenvolvimento nativo iOS.

[![CI](https://github.com/RknDEV1/swift-toolkit/actions/workflows/ci.yml/badge.svg)](https://github.com/RknDEV1/swift-toolkit/actions/workflows/ci.yml)

## Funcionalidades

- Extensões de String e Optional
- `UserDefaults` tipado
- Helper seguro de Keychain
- Validadores de e-mail e CPF
- Formatadores de data e números (pt-BR)
- Feedback tátil (Haptics)
- Cliente de rede leve
- Componentes e extensões SwiftUI reutilizáveis

## Requisitos

- iOS 17+
- macOS 14+
- Swift 5.9+
- Xcode 15+

## Instalação

### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/RknDEV1/swift-toolkit.git", from: "0.1.0")
]
```

## Exemplos de Uso

### Formatadores

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

### Rede

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

## Estrutura

```
Sources/SwiftToolkit/
├── Extensions/
├── Utilities/
└── Components/
```

## Licença

MIT License

---

# Swift Toolkit (English)

A clean and focused collection of reusable **Swift** and **SwiftUI** utilities for native iOS development.

See the sections above for features, requirements, installation and usage examples.
