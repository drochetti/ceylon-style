
shared object repeatBoth extends BackgroundRepeat("both") {
    //shared actual string = "both";
}

shared object repeatX extends BackgroundRepeat("x") {}

shared object repeatY extends BackgroundRepeat("y") {}

shared object noRepeat extends BackgroundRepeat(null) {}

shared abstract
class BackgroundRepeat(String? repeat)
    of repeatBoth | repeatX | repeatY | noRepeat
    satisfies StyleProperty {}
