import ceylon.style { Stylesheet, StyleImport, Style, Border }
import ceylon.style.serializer { SerializerConfiguration }

doc ""
shared abstract
class StylesheetSerializer(stylesheet, config = defaultConfiguration) {

    shared Stylesheet stylesheet;
    shared SerializerConfiguration config;

    variable Integer indentLevel = 0;

    shared formal void print(String string);

    shared void serialize() {
        visit(stylesheet);
    }

    void visit(Stylesheet stylesheet) {
        for (styleElement in stylesheet.styles) {
            switch(styleElement)
            case (is String->Style) { visitStyle(styleElement); }
            case (is StyleImport) { visitImport(styleElement); }
        }
    }

    void visitStyle(String->Style styleSpec) {
        linefeed();
        indent();
        print(styleSpec.key);
        openCurly();
        // TODO refactor when metamodel/reflection is done
        value style = styleSpec.item;
        value border = style.border;
        if (is Border border) {
            indent();
            print(border.string);
        }
        closeCurly();
        for (nestedStyle in style.nested) {
            visitStyle(nestedStyle);
        }
    }

    void visitImport(StyleImport styleImport) {
        value ref = styleImport.stylesheetReference;
        switch (ref)
        case(is String) { print("@import url('``ref``');"); }
        case(is Stylesheet) { visit(ref); }
    }

    void indent() {
        if (config.prettyPrint) {
            value spaces = indentLevel * 4;
            for (i in 0..spaces) {
                print(" ");
            }
        }
    }

    void openCurly() {
        if (config.prettyPrint) {
            print(" ");
        }
        print("{");
        linefeed();
        if (config.prettyPrint) {
            indentLevel++;
        }
    }

    void closeCurly() {
        linefeed();
        indentLevel--;
        indent();
        print("}");
        linefeed();
    }

    void linefeed() {
        if (config.prettyPrint) {
            print(process.newline);
        }
    }

}