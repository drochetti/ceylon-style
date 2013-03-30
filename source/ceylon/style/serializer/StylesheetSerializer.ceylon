import ceylon.collection { LinkedList }
import ceylon.style { Stylesheet, StyleImport, Style }
import ceylon.style.serializer { SerializerConfiguration }

doc ""
shared abstract
class StylesheetSerializer(stylesheet, config = defaultConfiguration) {

    shared Stylesheet stylesheet;
    shared SerializerConfiguration config;

    variable Integer indentLevel = 0;

    value selectors = LinkedList<String>();

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
        value selector = styleSpec.key;
        selectors.add(selector);

        linefeed();
        indent();
        printSelector();
        openCurly();

        // TODO refactor when metamodel/reflection is done
        value style = styleSpec.item;
        printProperty("background", style.background);
        printProperty("border", style.border);
        //printProperty(style.boxShadow);
        printProperty("color", style.color);
        printProperty("font-style", style.fontStyle);
        printProperty("font-weight", style.fontWeight);
        printProperty("line-height", style.lineHeight);
        printProperty("margin", style.margin);
        printProperty("opacity", style.opacity);
        printProperty("padding", style.padding);
        printProperty("text-align", style.textAlign);
        printProperty("text-decoration", style.textDecoration);
        printProperty("text-transform", style.textTransform);

        closeCurly();
        for (nestedStyle in style.nested) {
            visitStyle(nestedStyle);
        }
        if (exists last = selectors.lastIndex) {
            selectors.remove(last);
        }
    }

    void visitImport(StyleImport styleImport) {
        value ref = styleImport.stylesheetReference;
        switch (ref)
        case(is String) { print("@import url('``ref``');"); }
        case(is Stylesheet) { visit(ref); }
    }

    void printSelector() {
        // TODO I don't think it handle all the cases, benchmark LESS and SASS cases
        value selector = selectors.fold("", (String partial, String elem) {
            return ", ".join((partial).split(",").collect((String oneSelector) {
                value s = elem.trimmed;
                assert(exists first = s.first);
                return oneSelector + (first == '&' then s[1...] else " " + s);
            }));
        });
        print(selector.normalized);
    }

    void printProperty(String name, Object? property, Boolean prefixed = false) {
        if (exists property) {
            linefeed();
            indent();
            // TODO improve serialization of each property type (no generic .string or special cases)
            print("``name``: ``property.string.normalized``;");
        }
    }

    void indent() {
        if (config.prettyPrint) {
            value spaces = indentLevel * 4;
            if (spaces > 0) {
                print(" ".repeat(spaces));
            }
        }
    }

    void openCurly() {
        if (config.prettyPrint) {
            print(" ");
        }
        print("{");
        indentLevel++;
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