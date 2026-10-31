# Swift Toolkit

Coleção limpa de utilitários reutilizáveis em **Swift** e **SwiftUI** para apps iOS nativos.

[![CI](https://github.com/RknDEV1/swift-toolkit/actions/workflows/ci.yml/badge.svg)](https://github.com/RknDEV1/swift-toolkit/actions/workflows/ci.yml)
[![Swift](https://img.shields.io/badge/Swift-5.9+-orange.svg)](https://swift.org)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

> English: [README.md](README.md)

---

## Funcionalidades

| Categoria | Utilitários |
|-----------|-------------|
| **Armazenamento** | Keychain, UserDefaults tipado |
| **Validação** | E-mail e CPF |
| **Formatação** | Moeda (R$), números e datas (pt-BR) |
| **Rede** | Cliente HTTP leve (async/await) |
| **Feedback** | Haptics (iOS) |
| **Utilitários** | Debouncer, versão do app, Collection safe |
| **SwiftUI** | LoadingView, EmptyStateView |

---

## Requisitos

- iOS 17+
- macOS 14+
- Swift 5.9+

---

## Instalação

```swift
.package(url: "https://github.com/RknDEV1/swift-toolkit.git", branch: "main")
```

No Xcode: **File → Add Package Dependencies…** e cole a URL acima (branch `main`).

---

## Exemplos

```swift
// Formatação
Formatters.currency(19.90)
Date().brFormatted()

// Validação
Validator.isValidEmail("user@email.com")
Validator.isValidCPF("390.533.447-05")

// Keychain
try KeychainHelper.save("token", forKey: "auth")

// Debouncer (busca / salvar)
let debouncer = Debouncer(delay: 0.4)
debouncer.schedule { /* executar depois */ }

// Array seguro
let item = list[safe: 2]

// Versão do app
Bundle.main.versionLabel
```

---

## Licença

MIT — veja [LICENSE](LICENSE).
