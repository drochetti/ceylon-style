
shared class PseudoSelector(name)
        //of hover
        satisfies Selector {

    shared String name;

    css => ":``name``";

}

shared object hover extends PseudoSelector("hover") {}
