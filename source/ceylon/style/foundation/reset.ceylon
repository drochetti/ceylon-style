import ceylon.style { Stylesheet, Style, block }
import ceylon.style.selector { ... }

shared Stylesheet reset = Stylesheet {

    html -> Style {
    },

    a.focus -> Style {
    },

    [a.hover, a.active] -> Style {
        outline = 0;
    },

    [article, aside,
    details, figcaption,
    figure, footer,
    header, hgroup,
    nav, section] -> Style {
        display = block;
    }

};