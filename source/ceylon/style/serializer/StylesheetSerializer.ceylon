import ceylon.collection { LinkedList }
import ceylon.style { Stylesheet, StyleImport, Style, CssSelector }
import ceylon.style.serializer { SerializerConfiguration }

doc ""
shared abstract
class StylesheetSerializer(stylesheet, config = defaultConfiguration) {

    shared Stylesheet stylesheet;
    shared SerializerConfiguration config;

    variable Integer indentLevel = 0;

    value selectors = LinkedList<CssSelector>();

    shared formal void print(String string);

    shared void serialize() {
        visit(stylesheet);
    }

    void visit(Stylesheet stylesheet) {
        for (styleElement in stylesheet.styles) {
            switch(styleElement)
            case (is CssSelector->Style) { visitStyle(styleElement); }
            case (is StyleImport) { visitImport(styleElement); }
        }
    }
    
    void visitStyle(CssSelector->Style styleSpec) {
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
        // I'm sure this can be better, but it seems to do the job so far...
        value comma = ",";
        value selector = selectors.fold("", (String partial, CssSelector elem) {
            return comma.join((partial).split(comma).collect((CssSelector oneSelector) {
                value allSelectors = LinkedList<String>();
                for (e in elem.string.split(comma)) {
                    value s = e.trimmed;
                    assert(exists first = s.first);
                    allSelectors.add(oneSelector.string.trimmed
                            + (first == '&' then s[1...] else " " + s));
                }
                return comma.join(allSelectors);
            }));
        });
        if (config.prettyPrint) {
            value separator = comma + process.newline + indentString + " ";
            print(separator.join(selector.split(comma)));
        } else {
            print(selector.normalized);
        }
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
            print(indentString);
        }
    }

    String indentString {
        value spaces = indentLevel * 4;
        return spaces > 0 then " ".repeat(spaces) else "";
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