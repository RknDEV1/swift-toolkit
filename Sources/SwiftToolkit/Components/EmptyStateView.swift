import SwiftUI

/// Reusable empty state view.
public struct EmptyStateView: View {
    let title: String
    let systemImage: String
    let description: String?

    public init(
        title: String,
        systemImage: String = "tray",
        description: String? = nil
    ) {
        self.title = title
        self.systemImage = systemImage
        self.description = description
    }

    public var body: some View {
        ContentUnavailableView {
            Label(title, systemImage: systemImage)
        } description: {
            if let description {
                Text(description)
            }
        }
    }
}
