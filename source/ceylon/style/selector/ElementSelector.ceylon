
shared abstract class ElementSelector()
        of  el | a | abbr | address | area | article | aside | audio |
            b | base | bb | bdi | bdo | blockquote | body | br |
            button | canvas | caption | cite | code | col |
            colgroup | command | data | datagrid | datalist | dd | 
            del | details | dfn | div | dl | dt | em | embed | 
            eventsource | fieldset | figcaption | figure | footer | 
            form | h1 | h2 | h3 | h4 | h5 | h6 | head | header |
            hgroup | hr | html | i | iframe | img | input | ins | 
            kbd | keygen | label | legend | li | link | mark | 
            map | menu | meta | meter | nav | ol | optgroup | 
            option | output | p | param | pre | progress | q | 
            ruby | rp | rt | s | samp | section | select | small |
            source | span | strong | style | sub | summary | sup | 
            table | tbody | td | textarea | tfoot | th | thead | 
            time | title | tr | track | u | ul | video | wbr
        satisfies SelectorBuilder {

    shared actual default String css {
        // TODO improve this, remove code duplication (StyleProperty)
        variable value cssValue = className(this);
        if (exists last = cssValue.lastOccurrence(":")) {
            cssValue = cssValue[last + 1...];
        }
        return cssValue;
    }

}

"A selector that represents any element."
shared object el extends ElementSelector() {
    css => "";
}

//script | 
//var | 
//noscript | 
//object |

shared object a extends ElementSelector() {}

shared object abbr extends ElementSelector() {}

shared object address extends ElementSelector() {}

shared object area extends ElementSelector() {}

shared object article extends ElementSelector() {}

shared object aside extends ElementSelector() {}

shared object audio extends ElementSelector() {}

shared object b extends ElementSelector() {}

shared object base extends ElementSelector() {}

shared object bb extends ElementSelector() {}

shared object bdi extends ElementSelector() {}

shared object bdo extends ElementSelector() {}

shared object blockquote extends ElementSelector() {}

shared object body extends ElementSelector() {}

shared object br extends ElementSelector() {}

shared object button extends ElementSelector() {}

shared object canvas extends ElementSelector() {}

shared object caption extends ElementSelector() {}

shared object cite extends ElementSelector() {}

shared object code extends ElementSelector() {}

shared object col extends ElementSelector() {}

shared object colgroup extends ElementSelector() {}

shared object command extends ElementSelector() {}

shared object data extends ElementSelector() {}

shared object datagrid extends ElementSelector() {}

shared object datalist extends ElementSelector() {}

shared object dd extends ElementSelector() {}

shared object del extends ElementSelector() {}

shared object details extends ElementSelector() {}

shared object dfn extends ElementSelector() {}

shared object div extends ElementSelector() {}

shared object dl extends ElementSelector() {}

shared object dt extends ElementSelector() {}

shared object em extends ElementSelector() {}

shared object embed extends ElementSelector() {}

shared object eventsource extends ElementSelector() {}

shared object fieldset extends ElementSelector() {}

shared object figcaption extends ElementSelector() {}

shared object figure extends ElementSelector() {}

shared object footer extends ElementSelector() {}

shared object form extends ElementSelector() {}

shared object h1 extends ElementSelector() {}

shared object h2 extends ElementSelector() {}

shared object h3 extends ElementSelector() {}

shared object h4 extends ElementSelector() {}

shared object h5 extends ElementSelector() {}

shared object h6 extends ElementSelector() {}

shared object head extends ElementSelector() {}

shared object header extends ElementSelector() {}

shared object hgroup extends ElementSelector() {}

shared object hr extends ElementSelector() {}

shared object html extends ElementSelector() {}

shared object i extends ElementSelector() {}

shared object iframe extends ElementSelector() {}

shared object img extends ElementSelector() {}

shared object input extends ElementSelector() {}

shared object ins extends ElementSelector() {}

shared object kbd extends ElementSelector() {}

shared object keygen extends ElementSelector() {}

shared object label extends ElementSelector() {}

shared object legend extends ElementSelector() {}

shared object li extends ElementSelector() {}

shared object link extends ElementSelector() {}

shared object mark extends ElementSelector() {}

shared object map extends ElementSelector() {}

shared object menu extends ElementSelector() {}

shared object meta extends ElementSelector() {}

shared object meter extends ElementSelector() {}

shared object nav extends ElementSelector() {}

//shared object noscript extends ElementSelector() {}

//shared object object extends ElementSelector() {}

shared object ol extends ElementSelector() {}

shared object optgroup extends ElementSelector() {}

shared object option extends ElementSelector() {}

shared object output extends ElementSelector() {}

shared object p extends ElementSelector() {}

shared object param extends ElementSelector() {}

shared object pre extends ElementSelector() {}

shared object progress extends ElementSelector() {}

shared object q extends ElementSelector() {}

shared object ruby extends ElementSelector() {}

shared object rp extends ElementSelector() {}

shared object rt extends ElementSelector() {}

shared object s extends ElementSelector() {}

shared object samp extends ElementSelector() {}

//shared object script extends ElementSelector() {}

shared object section extends ElementSelector() {}

shared object select extends ElementSelector() {}

shared object small extends ElementSelector() {}

shared object source extends ElementSelector() {}

shared object span extends ElementSelector() {}

shared object strong extends ElementSelector() {}

shared object style extends ElementSelector() {}

shared object sub extends ElementSelector() {}

shared object summary extends ElementSelector() {}

shared object sup extends ElementSelector() {}

shared object table extends ElementSelector() {}

shared object tbody extends ElementSelector() {}

shared object td extends ElementSelector() {}

shared object textarea extends ElementSelector() {}

shared object tfoot extends ElementSelector() {}

shared object th extends ElementSelector() {}

shared object thead extends ElementSelector() {}

shared object time extends ElementSelector() {}

shared object title extends ElementSelector() {}

shared object tr extends ElementSelector() {}

shared object track extends ElementSelector() {}

shared object u extends ElementSelector() {}

shared object ul extends ElementSelector() {}

//shared object var extends ElementSelector() {}

shared object video extends ElementSelector() {}

shared object wbr extends ElementSelector() {}
