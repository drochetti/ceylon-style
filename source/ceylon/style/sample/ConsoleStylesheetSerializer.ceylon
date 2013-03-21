import ceylon.style { Stylesheet }
import ceylon.style.serializer { StylesheetSerializer, SerializerConfiguration, defaultConfiguration }

shared
class ConsoleStylesheetSerializer(Stylesheet stylesheet, SerializerConfiguration config = defaultConfiguration)
        extends StylesheetSerializer(stylesheet, config) {

    shared actual void print(String string) {
        process.write(string);
    }

}