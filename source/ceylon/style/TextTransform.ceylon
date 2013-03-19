
shared object capitalize extends TextTransform("capitalize") { }

shared object lowercased extends TextTransform("lowercase") { }

shared object uppercased extends TextTransform("uppercase") { }

shared abstract class TextTransform(transform) {
	shared String transform;
}