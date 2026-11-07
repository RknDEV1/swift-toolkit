# Swift Toolkit

Utilitários reutilizáveis em **Swift** para apps iOS nativos.

> English: [README.md](README.md)

## Recursos

| Área | APIs |
|------|------|
| **Armazenamento seguro** | Keychain, Keychain com biometria |
| **Biometria** | Face ID / Touch ID |
| Validação | E-mail e CPF |
| Formatação | Moeda (R$), números, datas |
| Rede | Cliente async leve |
| Helpers | Debouncer, índice seguro, versão do app |

## Uso — Biometria + Armazenamento seguro

```swift
if BiometricAuth.isAvailable {
    print("Usando \(BiometricAuth.typeName)")
}

let success = try await BiometricAuth.authenticate(
    reason: "Confirme sua identidade"
)

try SecureStorage.saveWithBiometrics("token-secreto", forKey: "auth")
let token = try SecureStorage.loadWithBiometrics(forKey: "auth")
```

## Licença

MIT
