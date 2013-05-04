
shared abstract class NestedSelector()
        of and
        satisfies SelectorBuilder {
}

shared object and extends NestedSelector() {
    css => "&";
}
