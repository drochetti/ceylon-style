import ceylon.style.type { Size }

shared object solid extends BorderStyle() {}

shared object dotted extends BorderStyle("dotted") {}

shared object dashed extends BorderStyle("dashed") {}

shared abstract
class BorderStyle(name = "solid")
    of solid | dotted | dashed {

    shared String name;

}

shared class Border(width = 1, style = solid, color = black)
        satisfies StyleProperty {

    shared Size|Integer width;

    shared BorderStyle style;

    shared Color color;

    shared actual String string => "border: ``width`` ``style.name`` ``color``;";

}
