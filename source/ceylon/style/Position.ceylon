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
shared class Position(horizontal = left, vertical = center) {

	shared HorizontalPosition horizontal;

	shared VerticalPosition vertical;

}
