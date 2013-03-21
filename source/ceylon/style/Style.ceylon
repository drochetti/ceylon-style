import ceylon.style.type { Inherit, None }

shared
class Style(background = null, border = null, boxShadow = {},
        color = null, fontStyle = null, fontWeight = null,
        margin = null, padding = null, nested = {}) {

    shared Background|Color|Gradient|None? background;
    shared Border|None? border;
	//shared Border? borderTop;
	//shared Border? borderRight;
	//shared Border? borderBottom;
	//shared Border? borderLeft;

    shared {BoxShadow*} boxShadow;

    shared Color|Inherit? color;

    doc ""
    shared FontStyle|Inherit? fontStyle;

    doc ""
    shared FontWeight|Inherit? fontWeight;

    shared Box? margin;

    shared Box? padding;

    shared {<String->Style>*} nested;

}