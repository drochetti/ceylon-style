
shared object defaultConfiguration extends SerializerConfiguration() {}

shared class SerializerConfiguration(prettyPrint = true,
    webkitPrefix = true, mozillaPrefix = true, operaPrefix = true) {

	shared Boolean prettyPrint;

	shared Boolean webkitPrefix;

	shared Boolean mozillaPrefix;
	
	shared Boolean operaPrefix;
	
}
