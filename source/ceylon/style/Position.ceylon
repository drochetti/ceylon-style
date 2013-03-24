import ceylon.style.type { Left, Right, left, Center, Top, Bottom, center, top, bottom, right }

shared object leftTop extends Position(left, top) {}

shared object leftCenter extends Position() {}

shared object leftBottom extends Position(left, bottom) {}

shared object centerTop extends Position(center, top) {}

shared object centerCenter extends Position(center, center) {}

shared object centerBottom extends Position(center, bottom) {}

shared object rightTop extends Position(right, top) {}

shared object rightCenter extends Position(right, center) {}

shared object rightBottom extends Position(right, bottom) {}

shared alias HorizontalPosition => Left|Center|Right;

shared alias VerticalPosition => Top|Center|Bottom;

doc ""
shared abstract class Position(horizontal = left, vertical = center)
    of leftTop | leftCenter | leftBottom
        | centerTop | centerCenter | centerBottom
        | rightTop | rightCenter | rightBottom
    satisfies StyleProperty {

	shared HorizontalPosition horizontal;

	shared VerticalPosition vertical;

    shared actual String string => "``horizontal`` ``vertical``";

}
