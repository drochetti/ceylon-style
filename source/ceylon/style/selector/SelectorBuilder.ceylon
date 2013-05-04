

shared interface SelectorBuilder satisfies Selector {

    shared default CompositeSelector id(String id) =>
            CompositeSelector(this, IdSelector(id));

    shared CompositeSelector cn(String cls) => classname(cls);

    shared default CompositeSelector classname(String cls) =>
            CompositeSelector(this, ClassNameSelector(cls));

    shared default CompositeSelector hover =>
            CompositeSelector(this, PseudoSelector("hover"));

    shared default CompositeSelector active =>
            CompositeSelector(this, PseudoSelector("active"));

    shared default CompositeSelector focus =>
            CompositeSelector(this, PseudoSelector("focus"));

}