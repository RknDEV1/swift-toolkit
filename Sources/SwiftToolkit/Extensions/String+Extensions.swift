import Foundation

public extension String {
    /// Returns true if the string is blank (empty or only whitespace).
    var isBlank: Bool {
        trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    /// Returns a trimmed version of the string.
    var trimmed: String {
        trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
