import Foundation

public extension Bundle {

    /// App version string from Info.plist (`CFBundleShortVersionString`).
    var appVersion: String {
        infoDictionary?["CFBundleShortVersionString"] as? String ?? "0"
    }

    /// Build number from Info.plist (`CFBundleVersion`).
    var buildNumber: String {
        infoDictionary?["CFBundleVersion"] as? String ?? "0"
    }

    /// Combined "version (build)" string.
    var versionLabel: String {
        "\(appVersion) (\(buildNumber))"
    }
}
