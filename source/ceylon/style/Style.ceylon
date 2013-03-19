import ceylon.style.type { Inherit }

shared
class Style(background = null, border = null, borderTop = null,
		borderRight = null,	borderBottom = null, borderLeft = null,
		boxShadow = {}, color = null, fontStyle = null, fontWeight = null,
		margin = null, padding = null, nested = {}) {

	shared Background|Color|Gradient? background;
	shared Border? border;
	shared Border? borderTop;
	shared Border? borderRight;
	shared Border? borderBottom;
	shared Border? borderLeft;

	shared {BoxShadow*} boxShadow;
	//shared String... properties;

	shared Color|Inherit? color;

	doc ""
	shared FontStyle|Inherit? fontStyle;

	doc ""
	shared FontWeight|Inherit? fontWeight;

	shared Box? margin;

	shared Box? padding;

	shared {<String->Style>*} nested;

}