import ceylon.style.type { Size }

shared class Outline(width = 1, style = solid, color = black)
        satisfies StyleProperty {

    shared Size|Integer width;

    shared BorderStyle style;

    shared Color color;

    shared actual String string => "``width`` ``style.name`` ``color``";

}
