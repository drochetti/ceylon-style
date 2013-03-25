import ceylon.style { ... }
import ceylon.style.type { ... }

Color defaultShadowColor = black.fadeTo(50);

Stylesheet widgets = Stylesheet {
    "button" -> Style {
        background = black;
        border = Border { width = 1; style = dashed; };
        padding = Box(5, 5, 5, 5);
    }
};

Integer defaultMargin = 10; // px

shared Stylesheet sampleStyles = Stylesheet {

    StyleImport(widgets),

    "body" -> Style {
        background = whitesmoke.fadeOut(20);
        border = Border { width = 2; };
        padding = Box(5, 5, 5, 5);
        fontWeight = bold;
        value margin {
            value margin = defaultMargin * 1.5;
            return Box {
                top = defaultMargin; right = margin.integer;
                bottom = defaultMargin; left = margin.integer;
            };
        }
        nested = {
            "#header" -> Style {
                background = Background {
                    color = transparent;
                    url = "/img/header.png";
                    position = leftCenter;
                    repeat = repeatX;
                };
                fontStyle = italic;
                nested = {
                    "&.selected" -> Style {
                        fontWeight = bolder;
                        fontStyle = inherit;
                    }
                };
            }
        };
    }

};
