import ceylon.style { ... }
import ceylon.style.selector { ... }
import ceylon.style.type { ... }

Color defaultShadowColor = black.fadeTo(50);

Stylesheet widgets = Stylesheet {
    "button" -> Style {
        background = black;
        Border { width = 1; style = dashed; };
        padding = [5, 10];
    }
};

Integer defaultMargin = 10; // px as adapter (extension method to Number)

shared Stylesheet sampleStyles = Stylesheet {

    StyleImport(widgets),

    body.cn("mobile").hover -> Style {
        background = whitesmoke.fadeOut(20);
        Border(2);
        padding = [2, px(5), 1, 2];
        fontWeight = bold;
        value margin {
            value margin = defaultMargin * 1.5;
            return [ defaultMargin, margin.integer, defaultMargin, margin.integer ];
        }

        {el.id("thumb").hover, span.cn("thumb")} -> Style {
            background = azure;
        },

        ".header, .header-alternative" -> Style {
            Background {
                color = transparent;
                url = "/img/header.png";
                position = leftCenter;
                repeat = repeatX;
            };
            fontStyle = italic;

            "&.selected, &:hover" -> Style {
                fontWeight = bolder;
                fontStyle = inherit;
            }

        }
    }

};
