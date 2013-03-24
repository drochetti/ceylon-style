
shared
interface StyleProperty {

    shared actual default String string {
        return className(this);
    }

}