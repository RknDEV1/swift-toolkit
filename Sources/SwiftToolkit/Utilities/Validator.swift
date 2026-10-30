import Foundation

public enum Validator {

    /// Basic email format validation.
    public static func isValidEmail(_ email: String) -> Bool {
        let trimmed = email.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return false }

        let pattern = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        return trimmed.range(of: pattern, options: .regularExpression) != nil
    }

    /// Validates a Brazilian CPF (with or without punctuation).
    public static func isValidCPF(_ cpf: String) -> Bool {
        let numbers = cpf.compactMap { Int(String($0)) }
        guard numbers.count == 11 else { return false }

        // Reject sequences like 00000000000, 11111111111, etc.
        if Set(numbers).count == 1 { return false }

        func checkDigit(from digits: [Int], factor: Int) -> Int {
            var sum = 0
            var currentFactor = factor
            for digit in digits {
                sum += digit * currentFactor
                currentFactor -= 1
            }
            let remainder = (sum * 10) % 11
            return remainder == 10 ? 0 : remainder
        }

        let firstNine = Array(numbers[0..<9])
        let d1 = checkDigit(from: firstNine, factor: 10)
        guard d1 == numbers[9] else { return false }

        let firstTen = Array(numbers[0..<10])
        let d2 = checkDigit(from: firstTen, factor: 11)
        return d2 == numbers[10]
    }
}
