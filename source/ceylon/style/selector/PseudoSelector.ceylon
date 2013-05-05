
shared abstract class PseudoSelector(name)
        of  active | after | before | firstChild |
            focus | hover | islink | lastChild 
        satisfies Selector {

    shared String name;

    css => ":``name``";

}

shared object active extends PseudoSelector("active") {}

shared object after extends PseudoSelector("after") {}

shared object before extends PseudoSelector("before") {}

shared object firstChild extends PseudoSelector("first-child") {}

shared object focus extends PseudoSelector("focus") {}

shared object hover extends PseudoSelector("hover") {}

shared object islink extends PseudoSelector("link") {}

shared object lastChild extends PseudoSelector("last-child") {}