
""
shared interface Selector {

    "The CSS representation of the selector."
    shared formal String css;

    shared actual String string => css;

}

shared class IdSelector(id) satisfies Selector {

    shared String id;

    css => "#``id``";

}

shared class ClassNameSelector(classname) satisfies Selector {

    shared String classname;

    css => ".``classname``";

}

shared class PseudoSelector(name)
        //of hover
        satisfies Selector {

    shared String name;

    css => ":``name``";

}

shared object hover extends PseudoSelector("hover") {}

shared interface SelectorBuilder satisfies Selector {

    shared default CompositeSelector id(String id) =>
            CompositeSelector(this, IdSelector(id));

    shared CompositeSelector cn(String cls) => classname(cls);

    shared default CompositeSelector classname(String cls) =>
            CompositeSelector(this, ClassNameSelector(cls));

    shared default CompositeSelector hover =>
            CompositeSelector(this, PseudoSelector("hover"));

}

shared abstract class ElementSelector()
        of el | div | body | span
        satisfies SelectorBuilder {

    shared actual default String css {
        // TODO improve this, remove code duplication (StyleProperty)
        variable value cssValue = className(this);
        if (exists last = cssValue.lastOccurrence(":")) {
            cssValue = cssValue[last + 1...];
        }
        return cssValue;
    }

}

shared class CompositeSelector(one, other)
        satisfies SelectorBuilder {

    shared Selector one;

    shared Selector other;

    shared actual String css => "``one.css````other.css``";

}

shared abstract class NestedSelector() satisfies Selector {
    
}

"A selector that represents any element."
shared object el extends ElementSelector() {
    css => "";
}

"A selector that represents the _body_ element."
shared object body extends ElementSelector() {}


"A selector that represents the _div_ element."
shared object div extends ElementSelector() {}

"A selector that represents the _span_ element."
shared object span extends ElementSelector() {}
