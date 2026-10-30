import Foundation

public enum Validator {

    public static func isValidEmail(_ email: String) -> Bool {
        let pattern = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        return email.range(of: pattern, options: .regularExpression) != nil
    }

    public static func isValidCPF(_ cpf: String) -> Bool {
        let numbers = cpf.compactMap { Int(String($0)) }
        guard numbers.count == 11 else { return false }

        // Reject known invalid sequences
        if Set(numbers).count == 1 { return false }

        func digit(from slice: ArraySlice<Int>, factor: Int) -> Int {
            var sum = 0
            var f = factor
            for n in slice {
                sum += n * f
                f -= 1
            }
            let mod = (sum * 10) % 11
            return mod == 10 ? 0 : mod
        }

        let d1 = digit(from: numbers[0..<9], factor: 10)
        let d2 = digit(from: numbers[0..<10], factor: 11)

        return d1 == numbers[9] && d2 == numbers[10]
    }
}
