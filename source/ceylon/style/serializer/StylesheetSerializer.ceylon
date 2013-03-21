import ceylon.style { Stylesheet, StyleElement, StyleImport, Style, Border }
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
            visitElement(styleElement);
        }
    }
    
    void visitElement(StyleElement styleElement) {
        switch(styleElement)
        case (is String->Style) {
            visitStyle(styleElement);
        }
        case (is StyleImport) {
            visitImport(styleElement);
        }
    }
    
    void visitStyle(String->Style styleSpec) {
        if (config.prettyPrint) { print(process.newline); }
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
        for (nestedStyle in style.nested) {
            visitStyle(nestedStyle);
        }
        closeCurly();
    }
    
    void visitImport(StyleImport styleImport) {
        if (styleImport.nativeImport) {
            print("@import url('``styleImport.stylesheet``');");
        } else {
            visit(styleImport.stylesheet);
        }
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
        if (config.prettyPrint) {
            print(process.newline);
            indentLevel++;
        }
    }
        
    void closeCurly() {
        if (config.prettyPrint) {
            print(process.newline);
        }
        indentLevel--;
        indent();
        print("}");
        if (config.prettyPrint) {
            print(process.newline);
        }
    }
    
}