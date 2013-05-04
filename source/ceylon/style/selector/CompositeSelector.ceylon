
shared class CompositeSelector(one, other)
        satisfies SelectorBuilder {

    shared Selector one;

    shared Selector other;

    shared actual String css => "``one.css````other.css``";

}