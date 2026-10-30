import Foundation

public enum Formatters {

    /// Formats a value in Brazilian Real (R$).
    public static func currency(
        _ value: Double,
        locale: Locale = Locale(identifier: "pt_BR")
    ) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = locale
        formatter.currencyCode = "BRL"
        return formatter.string(from: NSNumber(value: value)) ?? "R$ 0,00"
    }

    /// Formats an integer as currency from centavos.
    public static func currency(fromCentavos centavos: Int) -> String {
        currency(Double(centavos) / 100.0)
    }

    /// Formats a number with grouping separator (pt_BR).
    public static func number(
        _ value: Double,
        fractionDigits: Int = 0,
        locale: Locale = Locale(identifier: "pt_BR")
    ) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = locale
        formatter.minimumFractionDigits = fractionDigits
        formatter.maximumFractionDigits = fractionDigits
        return formatter.string(from: NSNumber(value: value)) ?? "\(value)"
    }
}
