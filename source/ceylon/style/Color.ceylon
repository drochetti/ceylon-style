
doc "A tuple representing the Red, Green and Blue of a `Color`"
shared alias RGB => [Integer, Integer, Integer];


shared class HSL(hue, saturation, lightness, alpha = 1.0) {

    shared Integer hue;
    shared Float saturation;
    shared Float lightness;
    shared Float alpha;

    shared HSL copy(Integer? h = null, Float? s = null,
            Float? l = null, Float? a = null) {
        return HSL {
            hue = h else hue;
            saturation = s else saturation;
            lightness = l else lightness;
            alpha = a else alpha;
        };
    }

    shared Color color => hsla(hue, saturation, lightness, alpha);

}

doc "A color model with operations based on LESS implementation."
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

    shared Integer hue => hsl.hue;

    shared Float saturation => hsl.saturation;

    shared Float lightness => hsl.lightness;

    shared actual default String css {
        return alpha < 1.0 then rgba else hex;
    }

    Float limitValue(Float val) {
        return min({1.0, max({0.0, val})});
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
        value maxColorByte = 255.0;
        value r = red.float / maxColorByte;
        value g = red.float / maxColorByte;
        value b = red.float / maxColorByte;

        value minColor = min({r, g, b});
        value maxColor = max({r, g, b});

        variable value h = 0.0;
        variable value s = 0.0;
        value l = (maxColor + minColor) / 2;

        if (maxColor != minColor) {
            value d = maxColor - minColor;
            s = l > 0.5
                    then d / (2 - maxColor - minColor)
                    else d / (maxColor + minColor);
            if (maxColor == r) {
                h = (g - b) / d + (g < b then 6 else 0);
            } else if (maxColor == g) {
                h = (b - r) / d + 2;
            } else if (maxColor == b) {
                h = (r - g) / d + 4;
            }
        }
        
        return HSL((h * 360).integer, s, l, alpha);
    }

    shared Color lighten(Integer amount) {
        assert(amount in percentageRange);
        value hslAttr = hsl;
        return hslAttr.copy {
            l = limitValue(hslAttr.lightness - (amount / 100.0));
        }.color;
    }

    shared Color darken(Integer amount) {
        assert(amount in percentageRange);
        value hslAttr = hsl;
        return hslAttr.copy {
            l = limitValue(hslAttr.lightness + (amount / 100.0));
        }.color;
    }

    shared Color saturate(Integer amount) {
        assert(amount in percentageRange);
        value hslAttr = hsl;
        return hslAttr.copy {
            s = limitValue(hslAttr.saturation + (amount / 100.0));
        }.color;
    }

    shared Color desaturate(Integer amount) {
        assert(amount in percentageRange);
        value hslAttr = hsl;
        return hslAttr.copy {
            s = limitValue(hslAttr.saturation - (amount / 100.0));
        }.color;
    }

    shared Color grayscale => desaturate(100);

    shared Color fadeIn(Integer amount) {
        assert(amount in percentageRange);
        value a = limitValue(alpha + (amount / 100.0));
        return Color(rgb, a);
    }

    shared Color fadeOut(Integer amount) {
        assert(amount in percentageRange);
        value a = limitValue(alpha - (amount / 100.0));
        return Color(rgb, a);
    }

    shared Color fadeTo(Integer amount) {
        assert(amount in percentageRange);
        return Color(rgb, limitValue(amount / 100.0));
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

shared Color hsla(Integer hue, Float saturation, Float lightness, Float alpha) {
    value h = (hue % 360) / 360.0;

    value m2 = lightness <= 0.5
            then lightness * (saturation + 1)
            else lightness + saturation - lightness * saturation;
    value m1 = lightness * 2 - m2;

    Integer calculateHue(Float partialHue) {
        value phue = partialHue < 0.0
                then partialHue + 1
                else (partialHue > 1.0 then partialHue - 1 else partialHue);
        variable value result = m1;
        if (phue * 6 < 1.0) {
            result = m1 + (m2 - m1) * phue * 6;
        } else if (phue * 2 < 1.0) {
            result = m2;
        } else if (phue * 3 < 2.0) {
            result = m1 + (m2 - m1) * (2 / 3 - phue) * 6;
        }
        return result.integer;
    }
    return rgba {
        red = calculateHue(h + 1 / 3) * 255;
        green = calculateHue(h) * 255;
        blue = calculateHue(h - 1 / 3) * 255;
        alpha = alpha;
    };
}

shared Color hsl(Integer hue, Float saturation, Float lightness) {
    return hsla(hue, saturation, lightness, 1.0);
}
