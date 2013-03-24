
shared object italic extends FontStyle("italic") { }

//shared object normal extends FontStyle("normal") { }

shared abstract class FontStyle(String style)
        of italic
        satisfies StyleProperty {

    shared actual String css => style;

}