
//shared alias StyleElement => StyleSelector|StyleImport;
shared alias StyleElement => <<String->Style>|StyleImport>;

shared
class Stylesheet(styles) {

    shared {<<String->Style>|StyleImport>*} styles;
    //shared {StyleElement*} styles;

}
