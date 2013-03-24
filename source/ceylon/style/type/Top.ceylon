import ceylon.style { StyleProperty }

shared object top extends Top() {}

shared abstract class Top() of top satisfies StyleProperty {}