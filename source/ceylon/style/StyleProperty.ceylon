
shared
interface StyleProperty {

    shared default String css {
        return className(this);
    }

    shared actual default String string => css;

}