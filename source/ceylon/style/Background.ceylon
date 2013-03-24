import ceylon.style.type { Inherit }

doc ""
shared class Background(color = null, url = null,
        position = leftCenter, repeat = repeatBoth)
        satisfies StyleProperty {

    shared Color|Inherit? color;

    shared String? url;

    shared Position position;

    shared BackgroundRepeat|Inherit repeat;

    String formatUrl {
        value url = this.url;
        if (exists url) {
            return "url('``url``')";
        } else {
            return "";
        }
    }

    shared actual String string {
        return "``color else ""`` ``formatUrl`` ``repeat`` ``position``";
    }

}