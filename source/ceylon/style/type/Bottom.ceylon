import ceylon.style { StyleProperty }

shared object bottom extends Bottom() {}

shared abstract class Bottom() of bottom satisfies StyleProperty {}