import ceylon.style.type { Inherit }

doc ""
shared class Background(color, position = leftCenter, repeat = repeatBoth) {

    shared Color|Inherit color;

    shared Position position;

    shared BackgroundRepeat|Inherit repeat;

}