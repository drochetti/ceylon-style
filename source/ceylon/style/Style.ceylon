import ceylon.style.type { ... }

shared
class Style(background = null, border = null, boxShadow = null,
        color = null, display = null, fontStyle = null, fontWeight = null,
        lineHeight = null, margin = null, opacity = null, outline = null,
        padding = null, textAlign = null, textDecoration = null,
        textTransform = null, nested = {}) {

    shared Background|Color|Gradient|None? background;
    shared Border|None? border;
    //shared Border? borderTop;
    //shared Border? borderRight;
    //shared Border? borderBottom;
    //shared Border? borderLeft;

    shared BoxShadow? boxShadow;

    shared Color|Inherit? color;

    shared Display? display;

    ""
    shared FontStyle|Inherit? fontStyle;

    ""
    shared FontWeight|Inherit? fontWeight;

    shared Box? margin;

    shared Float|Integer? opacity;

    shared Outline|Integer? outline;

    shared Box? padding;

    shared Integer|Float|Size|Normal|Inherit? lineHeight;

    shared TextAlign|Left|Center|Right|Inherit? textAlign;

    shared TextDecoration|None|Inherit? textDecoration;

    shared TextTransform|None|Inherit? textTransform;

    shared {<CssSelector->Style>*} nested;

    shared Style apply(Style style) {
        // TODO mix them
        return style;
    }

}