
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
