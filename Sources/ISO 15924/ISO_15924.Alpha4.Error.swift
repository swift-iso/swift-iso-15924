// ISO_15924.Alpha4.Error.swift
// ISO 15924
//
// Error type for ISO 15924 Alpha4 validation

extension ISO_15924.Alpha4 {
    public enum Error: Swift.Error, Sendable, Equatable {
        /// Code length is invalid (must be 4)
        case invalidCodeLength(Int)

        /// Code contains invalid characters (must be ASCII letters only)
        case invalidCharacters(String)

        /// Four-letter code is not recognized
        case invalidAlpha4Code(String)
    }
}
