
""
shared interface Selector {

    "The CSS representation of the selector."
    shared formal String css;

    shared actual String string => css;

}
