import ceylon.style { StyleProperty }

shared object right extends Right() {}

shared abstract class Right() of right satisfies StyleProperty {}