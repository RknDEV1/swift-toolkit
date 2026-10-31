import Foundation

public extension Collection {

    /// Returns true when the collection has no elements.
    var isNotEmpty: Bool {
        !isEmpty
    }
}

public extension Array {

    /// Safe subscript — returns nil if the index is out of bounds.
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
