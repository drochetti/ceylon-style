import ceylon.style { Stylesheet, Style, Border, Color, whitesmoke, blue, black, turquoise, wheat, solid }
import ceylon.style.selector { ... }
import ceylon.style.type { none }

// Initial tests of a "real life" daily stylesheet programming
// As a framework, how to make a "theme" concept? e.g. Easily extensible
// LESS and SASS has some caveats regarding theme extension, it's not trivial

shared Style buttonStyle(Color bgColor) {
    return Style {
        background = bgColor;

        and.when(focus) -> Style {
            background = bgColor.lighten(5);
        }

    };
}

shared Stylesheet buttons = Stylesheet {

    [btn, button] -> Style {

        border = Border {
            style = solid;
        };
        textDecoration = none;

        and.name(primary) -> buttonStyle(blue),

        and.name(secondary) -> buttonStyle(turquoise),

        and.name(alternative) -> buttonStyle(wheat),

        and.name(inverse) -> buttonStyle(black)

    }.apply(buttonStyle(whitesmoke))

};