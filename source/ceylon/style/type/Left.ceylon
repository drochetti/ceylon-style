import ceylon.style { StyleProperty }

shared object left extends Left() {}

shared abstract class Left() of left satisfies StyleProperty {}