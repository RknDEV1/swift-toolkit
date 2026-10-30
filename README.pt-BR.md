# Swift Toolkit

Coleção limpa de utilitários reutilizáveis em **Swift** e **SwiftUI** para iOS nativo.

[![CI](https://github.com/RknDEV1/swift-toolkit/actions/workflows/ci.yml/badge.svg)](https://github.com/RknDEV1/swift-toolkit/actions/workflows/ci.yml)

> Também disponível em inglês: [README.md](README.md)

---

## Funcionalidades

- Keychain seguro e UserDefaults tipado
- Validadores de e-mail e CPF
- Formatadores de moeda e data (pt-BR)
- Cliente de rede leve
- Haptics (iOS)
- Componentes SwiftUI básicos

## Instalação

```swift
.package(url: "https://github.com/RknDEV1/swift-toolkit.git", from: "0.1.0")
```

## Exemplos

```swift
Formatters.currency(19.90)
Date().brFormatted()
Date().relativeFormatted()
try KeychainHelper.save("token", forKey: "auth")
Validator.isValidEmail("user@example.com")
Haptic.success()
```

## Licença

MIT
