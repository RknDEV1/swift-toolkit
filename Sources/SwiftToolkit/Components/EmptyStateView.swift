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
        VStack(spacing: 16) {
            Image(systemName: systemImage)
                .font(.system(size: 48))
                .foregroundStyle(.secondary)

            Text(title)
                .font(.title2.weight(.semibold))

            if let description {
                Text(description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
