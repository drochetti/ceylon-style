import ceylon.style.selector { ClassNameSelector, IdSelector }


// common elements

shared object header extends IdSelector("header") {}

shared object footer extends IdSelector("footer") {}

shared object thumb extends ClassNameSelector("thumb") {}

shared object btn extends ClassNameSelector("btn") {}


// grid

shared object container extends ClassNameSelector("container") {}

shared object row extends ClassNameSelector("row") {}


// sizes

shared object tiny extends ClassNameSelector("tiny") {}

shared object small extends ClassNameSelector("small") {}

shared object medium extends ClassNameSelector("medium") {}

shared object large extends ClassNameSelector("large") {}


// states

shared object error extends ClassNameSelector("error") {}

shared object info extends ClassNameSelector("info") {}

shared object success extends ClassNameSelector("success") {}

shared object warning extends ClassNameSelector("warning") {}

shared object selected extends ClassNameSelector("selected") {}


// precedence

shared object primary extends ClassNameSelector("primary") {}

shared object secondary extends ClassNameSelector("secondary") {}

shared object alternative extends ClassNameSelector("alternative") {}
