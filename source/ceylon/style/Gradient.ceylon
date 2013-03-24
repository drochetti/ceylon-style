
shared abstract class Gradient(color) {

    shared Iterable<Color|ColorStop> color;

    doc ""
    shared formal String type;

}

shared class LinearGradient({Color|ColorStop*} color) extends Gradient(color) {

    shared actual String type = "linear";

}

shared class RadialGradient({Color|ColorStop*} color) extends Gradient(color) {

    shared actual String type = "radial";

}