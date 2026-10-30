import Foundation

public extension Optional where Wrapped == String {
    /// Returns true if the optional string is nil or blank.
    var isNilOrBlank: Bool {
        switch self {
        case .none:
            return true
        case .some(let value):
            return value.isBlank
        }
    }
}
