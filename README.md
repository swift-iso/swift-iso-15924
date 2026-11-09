# swift-iso-15924

Use this package when you need to validate, store or convert ISO 15924 script codes, such as `Latn` for Latin or `215` for the same script as a number. Start from `ISO_15924.Alpha4` for the four-letter form and from `ISO_15924.Numeric` for the three-digit form. For language codes use swift-iso-639, and for country codes use swift-iso-3166.

## Laws

- A code is valid only if it is one of the 274 codes in the package's table. Any other code, such as `Xxxx` or `001`, is refused.
- The whole private-use range is in the table: `Qaaa` to `Qabx`, numbered `900` to `949` in order, so `Qaab` is `901`.
- Letter codes are case-insensitive on input and always stored in title case, so `latn`, `LATN` and `lAtN` all give `Latn`.
- Letter input must be ASCII. A character that only case-maps to an ASCII letter, such as the Kelvin sign, is refused.
- A numeric code is exactly three ASCII digits and keeps its leading zeros, as in `050`.
- Converting between the two forms never fails and round-trips for every code.
- Both types encode as a single string, their stored form, and decoding validates the string the same way the initializer does.
