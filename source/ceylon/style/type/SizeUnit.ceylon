
shared object pixels extends Unit("pixels", "px") { }

shared object inches extends Unit("inches", "in") { }

shared object em extends Unit("em", "em") { }

shared abstract class Unit(name, classifier) {

    shared String name;

    shared String classifier;

}

shared class Size(size, unit = pixels) satisfies Number {

    shared Number size;

    shared Unit unit;

    shared actual Float float => size.float;
    
    shared actual Number fractionalPart => size.fractionalPart;
    
    shared actual Integer integer => size.integer;
    
    shared actual Number magnitude => size.magnitude;
    
    shared actual Boolean negative => size.negative;
    
    shared actual Boolean positive => size.positive;
    
    shared actual Integer sign => size.sign;
    
    shared actual Number wholePart => size.wholePart;

    shared actual String string => size.string + unit.classifier;

}

shared Size px(Number size) => Size(size, pixels);

shared alias StyleSize => Size|Integer|Float;

//shared interface NumberSizeExtensions adapts Number {
//    Size px => Size(this, px);
//}

