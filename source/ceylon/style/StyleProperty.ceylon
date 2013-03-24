
shared interface StyleProperty {

    shared default String css {
        variable value cssValue = className(this);
        if (exists last = cssValue.lastOccurrence(":")) {
            cssValue = cssValue.segment(last + 1, cssValue.size);
        }
        return cssValue;
    }

    shared actual default String string => css;

}