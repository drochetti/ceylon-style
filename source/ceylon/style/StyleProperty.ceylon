
shared interface StyleProperty {

    shared default String css {
        variable value cssValue = className(this);
        if (exists last = cssValue.lastOccurrence(":")) {
            cssValue = cssValue[last + 1...];
        }
        return cssValue;
    }

    shared actual default String string => css;

}