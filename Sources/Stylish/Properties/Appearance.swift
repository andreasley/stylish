public enum AppearanceValue: String {
    /// Removes default appearance, allowing an element to be styled individually
    case none
    /// Uses default appearance (based on OS and/or browser)
    case auto
}

public func Appearance(_ value: String) -> Property {
    Property(name: "appearance", value: value)
}

/// Specifies how a certain HTML element should appear
public func Appearance(_ value: AppearanceValue = .auto) -> Property {
    Appearance(value.rawValue)
}
