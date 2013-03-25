
Character[] hexChars = "0123456789abcdef".characters;

doc "Convert an `Integer` to its hexadecimal representation."
deprecated "Supposed to use an SDK function"
String toHex(Integer number) {
    value hexValue = StringBuilder();
    variable value decimal = number;
    while (!decimal.zero) {
        assert(exists h = hexChars[decimal.and(#0F)]);
        hexValue.insertCharacter(0, h);
        decimal = decimal.rightLogicalShift(4);
    }
    return hexValue.size > 0 then hexValue.string else number.string;
}

doc "Convert a hexadecimal `String` to its decimal representation."
deprecated "Supposed to use an SDK function"
Integer toDecimal(String hex) {
    variable value decimal = 0;
    for (hexChar in hex) {
        assert(hexChar in hexChars);
        // indexOf ?
        value d = hexChars.indexed.find(
            (Integer->Character elem) => elem.item == hexChar);
        assert(exists d);
        decimal = decimal.times(16).plus(d.key);
    }
    return decimal;
}
