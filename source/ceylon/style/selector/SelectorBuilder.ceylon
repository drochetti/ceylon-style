

shared interface SelectorBuilder satisfies Selector {

    shared default CompositeSelector id(String|IdSelector id) {
        switch (id)
        case (is String) {
            return CompositeSelector(this, IdSelector(id));
        }
        case (is IdSelector) {
            return CompositeSelector(this, id);
        }
    }

    shared default CompositeSelector name(String|ClassNameSelector cls) {
        switch (cls)
        case (is String) {
            return CompositeSelector(this, ClassNameSelector(cls));
        }
        case (is ClassNameSelector) {
            return CompositeSelector(this, cls);
        }
    }

    shared CompositeSelector n(String cls) => name(cls);

    shared default CompositeSelector when(PseudoSelector sel) =>
            CompositeSelector(this, sel);

}