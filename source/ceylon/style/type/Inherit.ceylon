import ceylon.style { StyleProperty }

shared object inherit extends Inherit() {}

shared abstract class Inherit() of inherit satisfies StyleProperty {}