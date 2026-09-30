import Testing

@testable import ISO_15924

@Suite
struct `Alpha4 ASCII input` {
    @Test(arguments: ["\u{17F}yrc", "Ta\u{212A}r", "\u{17F}inh"])
    func `a non-ASCII lookalike that case-maps to a code is refused`(_ text: String) {
        #expect(throws: ISO_15924.Alpha4.Error.self) {
            try ISO_15924.Alpha4(text)
        }
    }

    @Test(arguments: ["latn", "LATN", "Latn", "lAtN"])
    func `ASCII input in any case is normalized`(_ text: String) throws {
        #expect(try ISO_15924.Alpha4(text).value == "Latn")
    }
}
