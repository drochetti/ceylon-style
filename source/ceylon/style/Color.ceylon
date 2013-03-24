
shared alias RGB => [Integer, Integer, Integer];

shared alias HSL => [Integer, Integer, Integer];

shared class Color(rgb, alpha = 1.0) satisfies StyleProperty {

    value validRange = 0..255;
    assert(
        rgb[0] in validRange,
        rgb[1] in validRange,
        rgb[2] in validRange
    );

    shared RGB rgb;

    shared Float alpha;

    shared Integer red => rgb[0];

    shared Integer green => rgb[1];

    shared Integer blue => rgb[2];

    shared actual default String css {
        return alpha < 1.0 then rgba else hex;
    }

    shared String hex {
        value hexColor = "".join(rgb.map((Integer elem) {
            return elem.string; // convert to HEX using Ceylon SDK?
        }));
        return "#``hexColor``";
    }

    shared String rgba {
        value rgbSpec = ", ".join(rgb.map((Integer elem) => elem.string));
        return "rgba(``rgbSpec``, ``alpha``)".normalized;
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
        return this;
    }

    shared Color fadeTo(Integer ammount) {
        return this;
    }

//    shared Color mix(Color other, Integer weight = 50) {
//        return Color();
//    }

}

shared Color fromHex(String hexColorSpec) {
    assert(
        hexColorSpec.size == 7,
        exists firstChar = hexColorSpec.first,
        firstChar == '#'
    );
    hexColorSpec.segment(1, 2); // convert from HEX to Integer using SDK?
    return Color([0, 0, 0]);
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
