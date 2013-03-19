
shared object solid extends BorderStyle() {}

shared object dotted extends BorderStyle("dotted") {}

shared object dashed extends BorderStyle("dashed") {}

shared abstract
class BorderStyle(name = "solid") {
	shared String name;
}

shared class Border(width = 1, color = black, style = solid)
		satisfies StyleProperty {

	shared Integer width;
	shared Color color;
	shared BorderStyle style;

}