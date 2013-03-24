
shared class Box2([Integer, Integer?, Integer?, Integer?] spec) {

    shared Integer top = spec[0];
    shared Integer right = spec[1] else spec[0];
    shared Integer bottom = spec[2] else spec[0];
    shared Integer left = spec[3] else spec[1] else spec[0];

}

//Box2 b = Box2([2]);

shared class Box(top, right, bottom, left) {

	shared Integer? top;
	shared Integer? right;
	shared Integer? bottom;
	shared Integer? left;

	//if (is Integer top, is Nothing bottom) {
	//	bottom = top;
	//}

}