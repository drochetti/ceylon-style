
//shared alias StyleElement => StyleSelector|StyleImport;
shared alias StyleElement => <<String->Style>|StyleImport>;

shared
class Stylesheet(styles) {

    //shared {<String>-><Style>} syles;
    //shared Map<String, Style> styles;
    shared {<<String->Style>|StyleImport>*} styles;
    //shared {StyleElement*} styles;
    //shared {StyleElement*} elements;

	//shared Iterable<StyleElement> elements;

	//shared default Sequence<StyleElement> elements;

}
