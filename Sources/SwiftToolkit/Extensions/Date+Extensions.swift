import Foundation

public extension Date {

    /// Formats the date using Brazilian Portuguese locale by default.
    func brFormatted(
        dateStyle: DateFormatter.Style = .medium,
        timeStyle: DateFormatter.Style = .short,
        locale: Locale = Locale(identifier: "pt_BR")
    ) -> String {
        let formatter = DateFormatter()
        formatter.locale = locale
        formatter.dateStyle = dateStyle
        formatter.timeStyle = timeStyle
        return formatter.string(from: self)
    }

    /// Returns a relative description (e.g. "há 2 horas", "ontem").
    func relativeFormatted(locale: Locale = Locale(identifier: "pt_BR")) -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.locale = locale
        formatter.unitsStyle = .full
        return formatter.localizedString(for: self, relativeTo: Date())
    }

    /// Start of the current day.
    var startOfDay: Date {
        Calendar.current.startOfDay(for: self)
    }

    /// Checks if the date is today.
    var isToday: Bool {
        Calendar.current.isDateInToday(self)
    }
}
