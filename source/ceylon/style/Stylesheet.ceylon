import ceylon.style.selector { Selector }

shared alias CssSelector => String|[String+]|Selector|[Selector+];

shared
class Stylesheet(styles) {

    shared {<<CssSelector->Style>|StyleImport>*} styles;

}
