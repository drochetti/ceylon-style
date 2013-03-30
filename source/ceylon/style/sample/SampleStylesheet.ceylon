import ceylon.style { ... }
import ceylon.style.type { ... }

Color defaultShadowColor = black.fadeTo(50);

Stylesheet widgets = Stylesheet {
    "button" -> Style {
        background = black;
        Border { width = 1; style = dashed; };
        padding = Box(5, 5, 5, 5);
    }
};

Integer defaultMargin = 10; // px as adapter (extension method to Number)

shared Stylesheet sampleStyles = Stylesheet {

    StyleImport(widgets),

    "body" -> Style {
        background = whitesmoke.fadeOut(20);
        Border(2);
        padding = Box(5, 5, 5, 5);
        fontWeight = bold;
        value margin {
            value margin = defaultMargin * 1.5;
            return Box {
                top = defaultMargin; right = margin.integer;
                bottom = defaultMargin; left = margin.integer;
            };
        }
        "#header" -> Style {
            Background {
                color = transparent;
                url = "/img/header.png";
                position = leftCenter;
                repeat = repeatX;
            };
            fontStyle = italic;
            "&.selected" -> Style {
                fontWeight = bolder;
                fontStyle = inherit;
            }
        }
    }

};
