

shared object lighter extends FontWeight(300) {
    shared actual String css => "lighter";
}

shared object normal extends FontWeight(400) {
    shared actual String css => "normal";
}

shared object semibold extends FontWeight(600) {
    shared actual String css => "semibold";
}

shared object bold extends FontWeight(700) {
    shared actual String css => "bold";
}

shared object bolder extends FontWeight(800) {
    shared actual String css => "bolder";
}

shared class FontWeight(weight) satisfies StyleProperty {

    shared Integer weight;

    shared actual default String css => weight.string;

}