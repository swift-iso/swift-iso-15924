// ISO_15924.Numeric.Error.swift
// ISO 15924
//
// Error type for ISO 15924 Numeric validation

extension ISO_15924.Numeric {
    public enum Error: Swift.Error, Sendable, Equatable {
        /// Code length is invalid (must be 3)
        case invalidCodeLength(Int)

        /// Code contains invalid characters (must be ASCII digits only)
        case invalidCharacters(String)

        /// Numeric code is not recognized
        case invalidNumericCode(String)
    }
}
