import Testing

@testable import ISO_15924

enum `Private Use Tests` {}

extension `Private Use Tests` {
    @Suite
    struct `Private-use range` {
        @Test
        func `every code from Qaaa to Qabx maps to 900 through 949 in order`() throws {
            let letters: [Character] = Array("abcdefghijklmnopqrstuvwxyz" as String)
            let codes = letters.map { "Qaa\($0)" } + letters.prefix(24).map { "Qab\($0)" }
            #expect(codes.count == 50)
            for (offset, code) in codes.enumerated() {
                let alpha4 = try ISO_15924.Alpha4(code)
                let numeric = try ISO_15924.Numeric(String(900 + offset))
                #expect(ISO_15924.Numeric(alpha4) == numeric)
                #expect(ISO_15924.Alpha4(numeric) == alpha4)
            }
        }

        @Test(arguments: ["Qaab", "qaaz", "QABA"])
        func `a code inside the range is accepted`(_ text: String) throws {
            #expect(try ISO_15924.Alpha4(text).value.hasPrefix("Qa"))
        }

        @Test(arguments: ["Qaby", "Qabz", "Qaca"])
        func `a code past Qabx is refused`(_ text: String) {
            #expect(throws: ISO_15924.Alpha4.Error.self) {
                try ISO_15924.Alpha4(text)
            }
        }
    }
}
