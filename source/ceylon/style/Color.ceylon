
doc "A tuple representing the Red, Green and Blue of a `Color`"
shared alias RGB => [Integer, Integer, Integer];

doc "A tuple representing the Hue, Saturation and Lightness of a `Color`"
shared alias HSL => [Integer, Integer, Integer];

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

doc "A basic color model. Supports several color operations."
by "Daniel Rochetti"
shared class Color(rgb, alpha = 1.0)
        satisfies StyleProperty & Summable<Color> & Comparable<Color> {

    value positiveByteRange = 0..255;

    value percentageRange = 0..100;

    assert(
        rgb[0] in positiveByteRange,
        rgb[1] in positiveByteRange,
        rgb[2] in positiveByteRange
    );

    shared RGB rgb;

    shared Float alpha;

    shared Integer red => rgb[0];

    shared Integer green => rgb[1];

    shared Integer blue => rgb[2];

    shared Integer hue => hsl[0];

    shared actual default String css {
        return alpha < 1.0 then rgba else hex;
    }

    shared String hex {
        value hexColor = "".join(rgb.map((Integer elem) {
            // TODO convert to HEX using Ceylon SDK?
            value hexRep = toHex(elem);
            return hexRep.size == 1 then hexRep.repeat(2) else hexRep;
        }));
        return "#``hexColor``";
    }

    shared String rgba {
        value rgbSpec = ", ".join(rgb.map((Integer elem) => elem.string));
        return "rgba(``rgbSpec``, ``alpha``)";
    }

    shared HSL hsl {
        return [0, 0, 0];
    }

//    shared Color lighten() {
//        return Color();
//    }

//    shared Color darken() {
//        return Color();
//    }

//    shared Color saturate() {
//        return Color();
//    }

//    shared Color desaturate() {
//        return Color();
//    }

//    shared Color grayscale => desaturate();

//    shared Color fadeIn(Integer ammount) {
//        return Color();
//    }

    shared Color fadeOut(Integer ammount) {
        assert(ammount in percentageRange);
        // TODO impl
        return this;
    }

    shared Color fadeTo(Integer ammount) {
        assert(ammount in percentageRange);
        // TODO impl
        return this;
    }

    shared actual Color plus(Color other) => nothing; /* TODO auto-generated stub */

    shared actual Comparison compare(Color other) {
        value result = [
            red <=> other.red,
            green <=> other.green,
            blue <=> other.blue,
            alpha <=> other.alpha
        ];
        return result.find((Comparison elem) => elem != equal) else equal;
    }

//    shared Color mix(Color other, Integer weight = 50) {
//        return Color();
//    }

}

shared Color fromHex(String hexColorSpec) {
    // TODO add flexibility? such as compressed notation (#000), alpha and optional #
    assert(
        hexColorSpec.size == 7,
        exists firstChar = hexColorSpec.first,
        firstChar == '#'
    );
    // TODO convert from HEX to Integer using SDK?
    value red = toDecimal(hexColorSpec.segment(1, 2));
    value green = toDecimal(hexColorSpec.segment(3, 2));
    value blue = toDecimal(hexColorSpec.segment(5, 2));
    return Color([red, green, blue]);
}

shared Color rgba(Integer red, Integer green, Integer blue, Float alpha) {
	return Color([red, green, blue], alpha);
}

shared Color rgb(Integer red, Integer green, Integer blue) {
    return rgba(red, green, blue, 1.0);
}

shared Color hsla(Integer hue, Integer saturation, Integer lightness, Float alpha) {
    return nothing;
}

shared Color hsl(Integer hue, Integer saturation, Integer lightness) {
    return hsla(hue, saturation, lightness, 1.0);
}
