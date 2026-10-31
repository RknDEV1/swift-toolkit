import Foundation

/// Simple debouncer for delaying work (search fields, save actions, etc.).
@MainActor
public final class Debouncer {

    private let delay: TimeInterval
    private var task: Task<Void, Never>?

    public init(delay: TimeInterval = 0.35) {
        self.delay = delay
    }

    /// Schedules work after `delay`. Cancels any previous pending work.
    public func schedule(_ work: @escaping @MainActor () -> Void) {
        task?.cancel()
        task = Task {
            try? await Task.sleep(nanoseconds: UInt64(delay * 1_000_000_000))
            guard !Task.isCancelled else { return }
            work()
        }
    }

    /// Cancels any pending work.
    public func cancel() {
        task?.cancel()
        task = nil
    }
}
