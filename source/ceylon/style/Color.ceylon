
//alias Percentage extends Range(0, 100);

shared class Color() {

	shared Color lighten() {
		return Color();
	}

	shared Color darken() {
		return Color();
	}

	shared Color saturate() {
		return Color();
	}

	shared Color desaturate() {
		return Color();
	}

	shared Color grayscale() {
		return desaturate();
	}

	shared Color fadeIn(Integer ammount) {
		return Color();
	}

	shared Color fadeOut(Integer ammount) {
		return Color();
	}

	shared Color fadeTo(Integer ammount) {
		return Color();
	}

	shared Color mix(Color other, Integer weight = 50) {
		return Color();
	}

}

shared Color fromHex(String hexColorSpec) {
	return Color();
}

shared Color rgba(Integer red, Integer green, Integer blue, Float alpha) {
	return Color();
}

shared Color rgb(Integer red, Integer green, Integer blue) {
	return rgba(red, green, blue, 1.0);
}

shared Color black = fromHex("#000");
