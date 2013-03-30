
shared object repeatBoth extends BackgroundRepeat() {}

shared object repeatX extends BackgroundRepeat() {}

shared object repeatY extends BackgroundRepeat() {}

shared object noRepeat extends BackgroundRepeat() {}

shared abstract
class BackgroundRepeat()
    of repeatBoth | repeatX | repeatY | noRepeat
    satisfies StyleProperty {}
